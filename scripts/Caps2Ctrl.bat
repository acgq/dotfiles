@echo off
reg add "hklm\system\currentcontrolset\control\keyboard layout" /v "ScanCode Map" /t REG_BINARY /d "0000000000000000030000001d003a000100010000000000" /f
echo "键位已完成修改，重启系统后生效"
pause
