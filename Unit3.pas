unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Data.Win.ADODB;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
Uses Unit2;

procedure TForm3.Button1Click(Sender: TObject);
var
durum:String;
MyQuery:TADOQuery;
begin
durum:='';
      AdoQuery1.Active := False;
      AdoQuery1.SQL.Text := 'SELECT * FROM Giris WHERE username='+#39+edit1.Text+#39;
      AdoQuery1.Active := True;
      if AdoQuery1.RecordCount <= 0 then
      begin
          durum:='temiz';
      end
      else
      if AdoQuery1.RecordCount > 0 then
      begin
      MessageBox(handle, 'Bu kullanýcý adý zaten kullanýlýyor!', 'Baþarýsýz!', MB_OK + MB_ICONINFORMATION);
      end;
      AdoQuery1.Active := False;

      if(durum='temiz') Then
      begin
            MyQuery:=TADOQuery.Create(Self);
            MyQuery.Connection:=Form2.ADOConnection1;
            MyQuery.SQL.Text := 'INSERT INTO Giris (username,pass) VALUES ('+#39+edit1.Text+#39+', '+#39+edit1.Text+#39+')';
            MyQuery.ExecSQL;
            MessageBox(handle, 'Kullanýcý baþarýyla kaydedildi giriþ yapabilirsiniz.', 'Baþarýlý!', MB_OK + MB_ICONINFORMATION);
      end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  form3.Hide;
  form2.Show;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Halt;
end;

end.
