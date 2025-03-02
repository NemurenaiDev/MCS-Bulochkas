@echo off
@chcp 65001

set time_start=%time%
set date_start=%date%

echo Pulling server updates...

echo:
git pull origin master

TIMEOUT /T 5

echo:
echo:
echo:
echo Starting the server...
java -Xms2G -Xmx4G -Dfile.encoding=UTF-8 -jar server.jar nogui

echo:
echo:
echo:
git add *

echo:
git status

echo:
git commit -m "%date_start%-%time_start%--%date%-%time%"

echo:
echo:
echo:
echo Pushing server updates...

echo:
git push origin master


echo:
echo:
echo:
echo Changes uploaded... Hopefully...

pause
