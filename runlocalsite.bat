@echo off

echo Running local site instance...
call npx quartz build --serve
echo Done!
pause