State: proof of concept, stub. Not even alpha.

How to get things running?

There are two methods to handle changning environment:
1) opening separate command line prompt
2) using runners

== New method: using runners ==

Grab som21nt.zip

Unpack som21nt.zip somewhere, e. g. C:\home\OCTAGRAM\SOM_AND_OD\SOM\2.1

Put (or install) portable Delphi 7 into C:\home\OCTAGRAM\SOM_AND_OD\Delphi\7

Copy sample runners from Sample-Runners into 
C:\home\OCTAGRAM\SOM_AND_OD\Runner\

Add C:\home\OCTAGRAM\SOM_AND_OD\Runner to your PATH

Now you can run SOM and Delphi stuff this way:

call delphirunner.cmd 7 %~dp0 dcc32 SOMIRIMP.dpr
call somrunner.cmd 2.1 %~dp0 SOMIRIMP.exe
call delphirunner.cmd 7 %~dp0 dcc32 SOMIRTest.TestOut.dpr
call somrunner.cmd 2.1 %~dp0 SOMIRTest.TestOut.exe
call delphirunner.cmd 7 %~dp0 dcc32 SOMIRTest.IRTestOut.dpr
call somrunner.cmd 2.1 %~dp0 SOMIRTest.IRTestOut.exe

call somdelphirunner.cmd 2.1 7 %~dp0 delphi7 SOMIRIMP.dpr

This way we can run different combinations of Delphi and SOM version.

It became important because when the project was incepted, only SOM 3.0 for 
Windows was known to be available, but since then other things were
discovered:
1) Patch 3.5.9 for VisualAge C++ for Windows containing full SOM 2.1
2) The same patch (found on IBM FTP) also contains enough files to run DTC C++
3) OpenDoc for Windows with ComponentGlue works with SOM 2.1, but not SOM 3.0

So it makes sense to downgrade project from SOM 3.0 to SOM 2.1 eventually. 
We'll get DirectToSOM C++ and OLE Automation this way.

The project is in transition. It runs SOM 2.1 and use SOM 2.1 bindings, but 
they are less complete compared to 3.0 ones, so old stuff is continued to be 
borrowed from old bindings into the new ones.

== Command explanation ==

compilei.cmd:
  rem Compile SOM Interface Repository importer
  rem Use SOMIRIMP.SOM.pas bindings
  rem Produce SOMIRIMP.exe executable
  call delphirunner.cmd 7 %~dp0 dcc32 SOMIRIMP.dpr

runi.cmd
  rem Run SOM Interface Repository importer
  rem Use SOM.IR database
  rem Produce SOMIRTest.DumpOut.pas bindings
  call somrunner.cmd 2.1 %~dp0 SOMIRIMP.exe

compileo.cmd
  rem Compile simple tester of generated bindings (often to check for syntax errors)
  rem Use SOMIRTest.DumpOut.pas bindings
  rem Produce SOMIRTest.TestOut.dpr executable
  call delphirunner.cmd 7 %~dp0 dcc32 SOMIRTest.TestOut.dpr

runo.cmd
  rem Run simple tester of generated bindings
  call somrunner.cmd 2.1 %~dp0 SOMIRTest.TestOut.exe

compileoi.cmd
  rem Compile copy of SOM Interface Repository importer with new bindings
  rem Use SOMIRTest.DumpOut.pas bindings
  rem Produce SOMIRTest.IRTestOut.exe executable
  call delphirunner.cmd 7 %~dp0 dcc32 SOMIRTest.IRTestOut.dpr

runoi.cmd
  rem Run copy of SOM Interface Repository importer compiled with the new bindings
  rem Use SOM.IR database
  rem Produce SOMIRTest.IRTestOut.DumpOut.pas bindings
  call somrunner.cmd 2.1 %~dp0 SOMIRTest.IRTestOut.exe

From time to time new bindings get copied (manually) from 
SOMIRTest.DumpOut.pas to SOMIRIMP.SOM.pas, and SOM IR importer gets copied 
from SOMIRIMP.dpr to SOMIRTest.IRTestOut.dpr (with input and output unit names 
replaced).

== Old method: opening separate command line prompt ==

Grab som21nt.zip and som21nt.7z.

Unpack som21nt.zip somewhere, e. g. C:\Programs\IBM\SOM.

Edit bin\somenv.bat, set SOMBASE variable. E. g. it will look like 
this:

rem -- Uncomment and customize the following line for your file system.
set SOMBASE=C:\Programs\IBM\SOM
rem -- Once you have set SOMBASE you can delete the following line:

Open a new window with command line and run somenv.bat inside of it. 
Don't close the window, you will run everything else inside of it.

Run somcorba to generate C bindings (without stars).
It will generate .h files that I use for referencing purposes.
Run somxh to generate C++ bindings if you need them.

Now run Delphi IDE from command line window. If it was already opened, you 
have to close it. SOM Compiler does not work without environment variables. 
You can change environment variables on a global (or user) level if you 
know how to do it.

== SOM 3.0 ==

The project downgraded to SOM 2.1 and is not activelly tested against SOM 3.0,
but here are the steps:

Grab som30nt.zip and som301nt.7z.

Unpack som30nt.zip somewhere, e. g. C:\home\OCTAGRAM\SOM_AND_OD\SOM\3.0.

som30nt.zip is suffering from DEP, so replace bin\somwm35i.dll and 
bin\somws35i.dll with those ones from som301nt.7z.

Edit any of run*.cmd to change SOM version from 2.1 to 3.0 or run against SOM 
3.0 in some different way.
