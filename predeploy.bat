@echo off

rem 포트 번호를 입력합니다.
set /p port=3000:

rem 현재 사용 중인 포트를 확인합니다.
netstat -a -o

rem 해당 포트를 사용 중인 프로세스가 있는지 확인합니다.
for /f "delims=" %%i in ('netstat -a -o ^| findstr /i "%port%"') do (
  rem PID를 변수에 저장합니다.
  set "pid=%%i"

  rem 프로세스가 있으면 강제 종료합니다.
  if not "%pid%"=="" (
    taskkill /f /pid %pid%
  )
)

rem 프로세스가 없으면 메시지를 표시합니다.
if "%pid%"=="" (
  echo 해당 포트를 사용하는 프로세스가 없습니다.
)