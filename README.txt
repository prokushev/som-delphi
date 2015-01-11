State: proof of concept, stub. Not even alpha.

How to get things running?

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
are maid after CORBA style starless headers, so newemit output was 
reinterpreted in mind.

