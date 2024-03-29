{ %cpu=wasm32 }
{ %norun }

uses StrUtils, SysUtils;

function httpGet(url: ShortString; Var str_out:
    ShortString): ShortString; external 'wasi_snapshot_preview1';

var out_str : ShortString;

begin
        out_str:= DupeString( ' ' , 255 );

        httpGet('https://httpbin.org/get', out_str);

        writeln(out_str);
end.
