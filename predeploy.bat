@echo off

rem 현재 사용 중인 포트를 확인합니다.
netstat -a -o

rem 해당 포트를 사용 중인 프로세스의 PID를 확인합니다.
for /f "delims=" %%i in ('netstat -a -o ^| findstr /i "8080"') do (
    rem PID를 변수에 저장합니다.
    set "pid=%%i"
)

rem 해당 프로세스를 강제 종료합니다.
taskkill /f /pid %pid%