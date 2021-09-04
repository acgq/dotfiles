
echo "try to set vscode and idea vim settings"

Function Pause ($Message = "Press any key to continue . . . ") {
    if ((Test-Path variable:psISE) -and $psISE) {
        $Shell = New-Object -ComObject "WScript.Shell"
        $Button = $Shell.Popup("Click OK to continue.", 0, "Script Paused", 0)
    } else {
        Write-Host -NoNewline $Message
        [void][System.Console]::ReadKey($true)
        Write-Host
    }
}

if (!(Test-Path $env:APPDATA\Code\User\keybindings.json)) {
    echo "==> Trying to set vscode keybindings"
    cmd /c mklink /H  $env:APPDATA\Code\User\keybindings.json .\vscode\keybindings.json
    sleep 1
} else {
    echo "==> $env:APPDATA\Code\User\keybindings.json has exists"
}

if (!(Test-Path $env:APPDATA\Code\User\settings.json)) {
    echo "==> Trying to set vscode settings"
    cmd /c mklink /H  $env:APPDATA\Code\User\settings.json .\vscode\settings.json
} else {
    echo "==> $env:APPDATA\Code\User\settings.json has exists"
}

if (!(Test-Path $env:USERPROFILE\.ideavimrc)) {
    echo "==> Trying to set idea vim  settings "
    cmd /c mklink /H  $env:USERPROFILE\.ideavimrc .\ideavimrc\.ideavimrc
} else {
    echo "==> $env:USERPROFILE\.ideavimrc has exists"
}

if (!(Test-Path $HOME\AppData\Local\nvim)) {
    echo "==> Trying to set nvim settings "
    cmd /c mklink /D  $HOME\AppData\Local\nvim .\nvim
} else {
    echo "==> $HOME\AppData\Local\nvim has exists"
}

if (!(Test-Path $env:USERPROFILE\.ideavimrc)) {
    echo "==> Trying to set vim settings "
    cmd /c mklink /H  $env:USERPROFILE\.vimrc .\.vimrc
} else {
    echo "==> $env:USERPROFILE\.vimrc has exists"
}
Pause
