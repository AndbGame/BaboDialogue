
$SOURCE_FILES = ".\scripts\Source\*.psc"
$DEST_FOLDER = ".\scripts"

$FORCE_RECOMPILE = $false
$PAPYRUS_FOLDER = ".\PAPYRUS"

# stale/leftover sources shipped with the mod that the author does not compile
# (no matching .pex in the distribution)
$EXCLUDE_FILES = @(
    "BaboDiaQuestT.psc"   # 15-line test leftover declaring BaboDiaQuest again
)

$LOG_LEVEL = 1

$STATUS_COMPILED_SUCCESS = 1
$STATUS_COMPILED_FAILED = 2
$STATUS_COMPILED_SKIPPED = 3

function Log {

    param (
        [int] $Level,
        [string] $msg,
        [object] $object
    )

    if ($Level -ge $LOG_LEVEL) {
        if($object) {
            Write-Host "$msg : $object"
        } else {
            Write-Host $msg
        }
    }
}

function Compile {
    param (
        $file
    )
    Log -Level 1 -msg "Compile" -object $file
    $filePath = $file | Split-Path -Parent
    # find include.txt walking up from the file's dir (works for any layout depth)
    $dir = $filePath
    while ($dir -and -not (Test-Path -LiteralPath "$dir\include.txt" -PathType Leaf)) {
        $dir = Split-Path -Parent $dir
    }
    $includeFile = "$dir\include.txt"
    $flagsFile = Resolve-Path "$PAPYRUS_FOLDER\Flags.flg"
    [string]$include = $filePath
    if(Test-Path -LiteralPath $includeFile -PathType Leaf) {
        $lines = Get-Content -LiteralPath $includeFile
        foreach ( $line in $lines ) {
            $path = Resolve-Path -Path "$PAPYRUS_FOLDER\$line"
            $include = [string]::Join(';', $include, $path)
            Log -Level 0 -msg "Include " -object $path
        }
    } else {
        Log -Level 1 -msg "Include file not found" -object $includeFile
    }

    $process = Start-Process -Wait -NoNewWindow -PassThru -FilePath "$PAPYRUS_FOLDER\PapyrusCompiler.exe" -ArgumentList "`"$file`" -o=`"$DEST_FOLDER`" -i=`"$include`" -optimize -f=`"$flagsFile`""

    $ret = [PSCustomObject]@{
        command = "PapyrusCompiler"
        file = $file
        ExitCode = $process.ExitCode
        Status = if($process.ExitCode -eq 0) {$STATUS_COMPILED_SUCCESS} else {$STATUS_COMPILED_FAILED}
    }
    $ret
}

function CompileIfNewest {
    param (
        $file
    )

    $pexFile = $DEST_FOLDER + "\" + $file.BaseName + ".pex"
    Log -Level 0 -msg "Pex file" -object $pexFile
    if($FORCE_RECOMPILE) {
        Log -Level 0 -msg "Compile by force" -object $file
        Compile -file $file
    } else {
        if([System.IO.File]::Exists($pexFile)) {
            $pexFile = Get-Item $pexFile
            if ($file.LastWriteTime -gt $pexFile.LastWriteTime) {
                Log -Level 0 -msg "Compile by modification date" -object $file
                Compile -file $file
            } else {
                Log -Level 0 -msg "Skip by modification date" -object $file
                [pscustomobject]@{Status = $STATUS_COMPILED_SKIPPED}
            }
        } else {
            Log -Level 0 -msg "Compile by not compiled yet" -object $file
            Compile -file $file
        }
    }
}

$pscFiles = Get-ChildItem -Path $SOURCE_FILES -Force -Recurse -Exclude $PAPYRUS_FOLDER | Where-Object { $EXCLUDE_FILES -notcontains $_.Name }

foreach ( $pscFile in $pscFiles )
{
    Log -Level 0 -msg "Process" -object $pscFile
    $ret = CompileIfNewest -file $pscFile
    if($ret.Status -eq $STATUS_COMPILED_FAILED) {
        Write-Host "---"
        Write-Host "Build failed:"
        Write-Host "!" $ret.file.Name
        Write-Host "    -" $ret.command $ret.file
        Log -Level 0 -msg "Process result" -object $ret
        Exit
    } else {
        Log -Level 0 -msg "Process result" -object $ret
    }
}
