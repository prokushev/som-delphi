program SOMIRTest;

{$APPTYPE CONSOLE}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

uses
  SysUtils,
  TypInfo,
  SOMIRTest.DumpOut in 'SOMIRTest.DumpOut.pas';

procedure TestSOM_Basic;
var
  o: SOMObject;
  s: CORBAString;
begin
  o := SOMObject.Create;
  s := o.somGetClassName;
  WriteLn('Object''s class name is ', s);
  o.somFree;
end;

procedure TestSOM_Renew;
var
  a: array of Byte;
  Size: LongInt;
  o: SOMObject;
  s: CORBAString;
begin
  Size := SOMObject.ClassObject.somGetInstanceSize;
  WriteLn('SOMObject''s size is ', Size);
  SetLength(a, Size);
  o := SOMObject.ClassObject.somRenew(@(a[0]));
  s := o.somGetClassName;
  WriteLn('Object''s class name is ', s);
  s := o.ClassObject.somGetClassName;
  WriteLn('Object''s class''s class name is ', s);
  s := o.somGetClass.somGetClassName;
  WriteLn('Object''s class''s class name is ', s);
  s := SOMClassMgr.NewClass.somGetName;
  WriteLn('SOMClassMgr''s name is ', s);
  s := SOMClassMgr.NewClass.somGetClassName;
  WriteLn('SOMClassMgr''s class object''s name is ', s);
  o.somUninit;
end;

procedure TestAlignmentAndSize;
var
  MyTC: TypeCode;
begin
  MyTC := TypeCode.Create(tk_struct, ['Test_1',
                            'VByte', TypeCode.Create(tk_octet),
                            'VInteger', TypeCode.Create(tk_long)
                          ]);
  WriteLn('Test_1 size: ', MyTC.Size);
  MyTC.Free;
  MyTC := TypeCode.Create(tk_struct, ['Test_2',
                            'VByte', TypeCode.Create(tk_octet),
                            'VSubrecord', TypeCode.Create(tk_struct, ['Test_1',
                              'VByte', TypeCode.Create(tk_octet),
                              'VInteger', TypeCode.Create(tk_long)
                            ])
                          ]);
  WriteLn('Test_2 size: ', MyTC.Size);
  MyTC.Free;
  MyTC := TypeCode.Create(tk_struct, ['Test_3',
                            'VByte', TypeCode.Create(tk_octet),
                            'VSubrecord', TypeCode.Create(tk_struct, ['Test_4',
                              'VByte', TypeCode.Create(tk_octet),
                              'VByte', TypeCode.Create(tk_octet),
                              'VDouble', TypeCode.Create(tk_double)
                            ])
                          ]);
  WriteLn('Test_3 size: ', MyTC.Size);
  MyTC.Free;
end;

begin
  try
    WriteLn('Testing SOMObject v', SOM_MajorVersion, '.', SOM_MinorVersion);
    SOM_MainProgram;
    SOMObject.NewClass;
    TestSOM_Basic;
    TestSOM_Renew;
    TestAlignmentAndSize;
  except
    on e: Exception do
      WriteLn(GetTypeData(e.ClassInfo).UnitName + '.' + e.ClassName + ':' + e.Message);
  end;
  ReadLn;
end.
