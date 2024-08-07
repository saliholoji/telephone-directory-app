unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;


implementation

{$R *.dfm}

Uses Unit1,Unit3;

procedure TForm2.Button1Click(Sender: TObject);
var
Form1: TForm1;
veri:String;
begin
      AdoQuery1.Active := False;
      AdoQuery1.SQL.Text := 'SELECT * FROM Giris WHERE username='+#39+edit1.Text+#39+' and pass='+#39+edit2.Text+#39;
      AdoQuery1.Active := True;
      if AdoQuery1.RecordCount > 0 then
      begin
           MessageBox(handle, 'Ba�ar�yla giri� yap�ld�!', 'Ba�ar�l�!', MB_OK + MB_ICONINFORMATION);
           Form1:=TForm1.Create(Self);
           form2.Hide;
           form1.Show;
      end
      else
      if AdoQuery1.RecordCount <=0 then
      begin
      MessageBox(handle, 'Kullan�c� Ad� veya �ifreniz yanl��', 'Ba�ar�s�z!', MB_OK + MB_ICONINFORMATION);
      end;
      AdoQuery1.Active := False;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
     form2.Hide;
     form3.Show;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Halt;
end;


end.
