{ uBase62

  Base62 Encode/Decode
  Javascript Ported!

}
unit uBase62;

interface

Uses Math;

    Function Base62Decode(vNum: String): Integer;
    Function Base62Encode(vNum: Integer): String;

implementation

Function Base62Decode(vNum: String): Integer;
Const Base62 = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
Var vCt : Integer;
   vAux: String;
Begin
 Result := 0;
 For vCt:=1 to Length(vNum) do Begin
     Result := 62 * Result + Pos(vNum[vCt], Base62)-1;
 End;
End;

Function Base62Encode(vNum: Integer): String;
Const Base62 = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
Var vR: Integer;
    vQ: Integer;
Begin
  vR     := vNum Mod 62;
  Result := Copy(Base62, vR+1, 1);
  vQ     := Floor(vNum / 62);
  While vQ<>0 do Begin
      vR     := vQ mod 62;
      vQ     := Floor(vQ / 62);
      Result := Copy(Base62, vR+1, 1) + Result;
  End;
End;

end.
