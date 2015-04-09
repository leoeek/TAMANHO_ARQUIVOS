unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, JvBaseDlg, JvSelectDirectory, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, JvExDBGrids, JvDBGrid, JvExControls, JvLabel;

type
  meuArquivo = Record
    tipo: String;
    tamanho: Real;
    total: Real;
    nome: String;
  end;

type
  TForm1 = class(TForm)
    Button1: TButton;
    op: TJvSelectDirectory;
    cdsDiretorios: TClientDataSet;
    cdsDiretoriosNOME: TStringField;
    ds1: TDataSource;
    cdsDiretoriosTAMANHO: TStringField;
    cdsDiretoriosTOTAL: TFloatField;
    cdsDiretoriosTIPO: TStringField;
    DBGrid1: TJvDBGrid;
    JvLabel1: TJvLabel;
    lbAguarde: TJvLabel;
    function TamanhoArquivo(Arquivo: string): meuArquivo;
    procedure Button1Click(Sender: TObject);
    procedure ListarArquivos(Diretorio: string; Sub:Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  diretorio: String;
begin
  cdsDiretorios.EmptyDataSet;
  cdsDiretorios.Close;
  cdsDiretorios.Open;

  diretorio := '';

  if (op.Execute) then
  begin
    diretorio := op.Directory;
    if (diretorio <> '') then
    begin
      ListarArquivos(diretorio, true);
    end;
  end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  cdsDiretorios.IndexFieldNames := Column.FieldName;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cdsDiretorios.CreateDataSet;
  cdsDiretorios.EmptyDataSet;

//  with cdsDiretorios.IndexDefs.AddIndexDef do
//  begin
//    Name    := 'OrdenarUltimoPrimeiroNomedx';
//    Fields  := 'TOTAL';
//    Options := [ixDescending, ixCaseInsensitive];
//  end;
//
//  cdsDiretorios.IndexName := 'OrdenarUltimoPrimeiroNomedx';

  cdsDiretorios.Open;
end;

procedure TForm1.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
  resultado: meuArquivo;
begin

  Ret := FindFirst(Diretorio + '\*.*', faAnyFile, F);
  try
    lbAguarde.Visible := True;
    lbAguarde.Caption := 'Por favor, aguarde...';
    Application.ProcessMessages;

    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
        begin
          if Sub = True then
          begin
            TempNome := Diretorio + '\' + F.Name;
            ListarArquivos(TempNome, True);
          end;
        end;
      end
      else
      begin
        cdsDiretorios.Append;
        cdsDiretoriosNOME.AsString    := Diretorio + '\' + F.Name;
        resultado                     := TamanhoArquivo(Diretorio + '\' + F.Name);
        cdsDiretoriosTAMANHO.AsFloat  := resultado.tamanho;
        cdsDiretoriosTIPO.AsString    := resultado.tipo;
        cdsDiretoriosTOTAL.AsFloat    := resultado.total;
        cdsDiretorios.Post;
      end;

      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
    lbAguarde.Visible := False;
  end;
end;



function TForm1.TamanhoArquivo(Arquivo: string): meuArquivo;
const
  B  = 1;         // Byte
  KB = 1024 * B;  // Kilobyte
  MB = 1024 * KB; // Megabyte
  GB = 1024 * MB; // Gigabyte

var
  ProcurarArquivo : TSearchRec;
  TamanhoArquivo  : Longint;
  Resultado       : String;
begin
  //*** Pega o tamanho do arquivo em "Bytes" que você selecionou...
  if FindFirst(Arquivo, FaAnyFile, ProcurarArquivo) = 0 then
  begin
     TamanhoArquivo := Int64(ProcurarArquivo.FindData.nFileSizeHigh) SHL Int64(32) +
                       Int64(ProcurarArquivo.FindData.nFileSizeLow);
  end;

  Result.total   := TamanhoArquivo;

  //*** Veirifica se o tamanho total do arquivo é em: B, KB, MB ou GB...
  if TamanhoArquivo > GB then
  begin
    Result.tamanho := TamanhoArquivo/GB;
    Result.tipo    := 'GB';
  end
  else
  if TamanhoArquivo > MB then
  begin
    Result.tamanho := TamanhoArquivo/MB;
    Result.tipo    := 'MB';
  end
  else
  if TamanhoArquivo > KB then
  begin
    Result.tamanho := TamanhoArquivo/KB;
    Result.tipo    := 'KB';
  end
  else
  begin
    Result.tamanho := TamanhoArquivo;
    Result.tipo    := 'bytes';
  end;
end;

function TForm1.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

end.
