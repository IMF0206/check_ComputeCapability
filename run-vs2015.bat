@echo off

set build_dir=build-vs2015
if not exist %build_dir% md %build_dir%

cd %build_dir%
cmake .. -G "Visual Studio 14 2015 Win64"
cmake --build . --config Release
.\Release\app.exe
cd ..
