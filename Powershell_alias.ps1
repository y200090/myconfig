# touch
function touch($filename) { 
    New-Item -type file $filename
}

# which
function which($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# ln
function ln([switch]$s, [string]$filepath, [string]$linkname) {
    if ($s) {
        New-Item -ItemType SymbolicLink -Value $filepath -Name $linkname
    }
}

# open
function open($filepath) {
    Invoke-Item $filepath
}

# rm
function rm([switch]$s, [string]$filename) {
    if ($s) {
        Remove-Item -Recurse -Force $filename
    }
    else {
        Remove-Item -Force $filename
    }
}
