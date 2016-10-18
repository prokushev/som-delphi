State: proof of concept, stub. Not even alpha.

How to get things running?

There are two methods to handle changning environment:
1) opening separate command line prompt
2) using runners

== New method: using runners ==

Grab som30nt.zip and som301nt.7z.

Unpack som30nt.zip somewhere, e. g. C:\home\OCTAGRAM\SOM_AND_OD\SOM\3.0.

som30nt.zip is suffering from DEP, so replace bin\somwm35i.dll and 
bin\somws35i.dll with those ones from som301nt.7z.

Put (or install) portable Delphi 7 into C:\home\OCTAGRAM\SOM_AND_OD\Delphi\7

Copy sample runners from Sample-Runners into 
C:\home\OCTAGRAM\SOM_AND_OD\Runner\

Add C:\home\OCTAGRAM\SOM_AND_OD\Runner to your PATH

Now you can run SOM and Delphi stuff this way:

call delphirunner.cmd 7 %~dp0 dcc32 emitdelphi.dpr
call somrunner.cmd 3.0 %~dp0 sc -v -sdelphi -m"namespace=TestEmit" emit2.idl
call somdelphirunner.cmd 3.0 7 %~dp0 delphi7 emitdelphi.dpr

This way we can run different combinations of Delphi and SOM version.

It became important because when the project was incepted, only SOM 3.0 for 
Windows was known to be available, but since then other things were
discovered:
1) Patch 3.5.9 for VisualAge C++ for Windows containing full SOM 2.1
2) The same patch (found on IBM FTP) also contains enough files to run DTC C++
3) OpenDoc for Windows with ComponentGlue works with SOM 2.1, but not SOM 3.0

So it makes sense to downgrade project from SOM 3.0 to SOM 2.1 eventually. 
We'll get DirectToSOM C++ and OLE Automation this way.

== Old method: opening separate command line prompt ==

Grab som30nt.zip and som301nt.7z.

Unpack som30nt.zip somewhere, e. g. C:\Programs\IBM\SOM.

som30nt.zip is suffering from DEP, so replace bin\somwm35i.dll and 
bin\somws35i.dll with those ones from som301nt.7z.

Edit bin\somenv.cmd, set SOMBASE variable. E. g. it will look like 
this:

rem -- Uncomment and customize the following line for your file system.
set SOMBASE=C:\Programs\IBM\SOM
rem -- Once you have set SOMBASE you can delete the following line:

Open a new window with command line and run somenv.cmd inside of it. 
Don't close the window, you will run everything else inside of it.

Run somcorba to generate C bindings (without stars).
It will generate .h files that I use for referencing purposes.
Run somxh to generate C++ bindings if you need them.

Copy delphi.efw to SOM\include.

Now run Delphi IDE from command line window. If it was opened, you have 
to close it. SOM Compiler does not work without environment variables. 
You can change environment variables on a global (or user) level if you 
know how to do it.

SOMClientTest.dpr is only for client testing. It does creation, outputs 
SOMObject instance size, which is 4 on Win32, outputs it's class name, 
which is 'SOMObject', of course.

emitdelphi.dpr is supposed to be Delphi emitter in Delphi, but now it is 
stub emitter in Delphi. It outputs .pas, but this output is meaningless. 
It is just dump.

If you want to run this from Delphi, open Run > Parameters...
specify Host application: C:\Programs\IBM\SOM\bin\sc.exe
Parameters: -sdelphi C:\Programs\IBM\SOM\include\somobj.idl
Fix pathes for your case.

Debug is not possible because sc.exe launches yet another process which 
actually loads emitter.dll. It is preferred to run from command line:

sc -sdelphi C:\Programs\IBM\SOM\include\somobj.idl

It outputs to C:\Programs\IBM\SOM\include\somobj.pas


Note: SOM DTK supports 2 ways of naming classes. CORBA style don't 
have stars, and C++ style has. There is also somstars for generating C
headers with stars. They can't mix for obvious reasons. C samples use 
CORBA style only. newemit code assumes stars mode only. Delphi bindings 
are made after CORBA style starless headers, so newemit output was 
reinterpreted in mind.

