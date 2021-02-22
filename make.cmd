@echo off

rem Compile app
echo Compiling app...
cd app
call elm make src/Main.elm --output index.js
if %ERRORLEVEL% neq 0 goto ErrorCompilingApp
cd ..
echo -------------------------

rem Compile functions
echo Compiling api functions...
cd api/hello
call spago bundle-module --to index.js
if %ERRORLEVEL% neq 0 goto ErrorCompilingFunction
call mcpp handler.js -P -o hello.js
cd ..\..
echo -------------------------

rem Create or empty deploy directory
echo Creating deploy directory
if exist deploy\ (
	rmdir deploy /s /q
)
echo -------------------------

rem Copy app files
echo Copy app files...
xcopy app\index.*         deploy\
xcopy app\libmdc\libmdc.* deploy\libmdc\
xcopy app\assets          deploy\assets /e /i
echo -------------------------

rem Copy api files
echo Copy api files...
xcopy api\hello\hello.js deploy\api\ 
echo -------------------------

rem Copy vercel stuff
echo Copying vercel files...
xcopy vercel deploy /e /i
echo -------------------------

rem Cleaning compilation
echo Cleaning...
del /q app\index.js
del /q api\hello\index.js
del /q api\hello\hello.js
echo -------------------------

goto End

:ErrorCompilingFunction
echo "Error compiling function"
cd ..\..
goto End

:ErrorCompilingApp
echo "Error compiling app"
cd ..
goto End

:End