@echo off
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem      https://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

SETLOCAL
SET PWD=%~dp0
call %PWD%\check_env_windows.bat
call %PWD%\..\data\setup_%LOCALE%.bat

%JAVA_BIN%\java -classpath %PWD%\text_blocks.jar GenerateTestSource %TEST_STRINGS% > TextBlocksTest.java 2>&1
%JAVA_BIN%\javac TextBlocksTest.java
%JAVA_BIN%\java TextBlocksTest > result.txt 2>&1

fc result.txt %PWD%\expected\windows_%LOCALE%.txt > fc.out 2>&1
exit %errorlevel%