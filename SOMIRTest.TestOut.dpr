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
  o, o2: SOMObject;
begin
  o := SOMObject.Create;
  try
    WriteLn('Object''s class name is ', o.somGetClassName);
    WriteLn('Object''s class name is ', o.ClassName);
    o2 := o.Clone;
    try
      WriteLn('Second object''s class name is ', o2.ClassName);
    finally
      SOMFreeAndNil(o2);
    end;
  finally
    SOMFreeAndNil(o);
  end;
end;

procedure TestSOM_Renew;
var
  a: array of Byte;
  Size: LongInt;
  o: SOMObject;
begin
  Size := SOMObject.InstanceSize;
  WriteLn('SOMObject''s size is ', Size);
  SetLength(a, Size);
  o := SOMObject.InitInstance(@(a[0]));
  o.somInit;
  try
    WriteLn('Object''s class name is ', o.somGetClassName);
    WriteLn('Object''s class''s class name is ', o.ClassObject.somGetClassName);
    WriteLn('Object''s class''s class name is ', o.somGetClass.somGetClassName);
    WriteLn('SOMClassMgr''s name is ', SOMClassMgr.NewClass.somGetName);
    WriteLn('SOMClassMgr''s name is ', SOMClassMgr.ClassName);
    WriteLn('SOMClassMgr''s class object''s name is ', SOMClassMgr.NewClass.somGetClassName);
  finally
    o.somUninit;
  end;
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
