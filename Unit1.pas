unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, DateUtils,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    txtÝsim: TDBEdit;
    txtTelefon: TDBEdit;
    txtEposta: TDBEdit;
    txtNot: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Timer1: TTimer;
    DBCheckBox1: TDBCheckBox;
    btnYeniKayit: TButton;
    btnKaydet: TButton;
    btnSil: TButton;
    btnDuzenle: TButton;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure btnYeniKayitClick(Sender: TObject);
    procedure btnKaydetClick(Sender: TObject);
    procedure btnSilClick(Sender: TObject);
    procedure btnDuzenleClick(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  kisi:string;
implementation
{$R *.dfm}

procedure TForm1.btnYeniKayitClick(Sender: TObject);
begin
  // Tabloyu kayýt ekleme moduna aldýk
  ADOTable1.Insert;

  // Ýsim bölümüne focus ettik.
  txtÝsim.SetFocus;

  // Buton durumlarýný güncelledik
  btnYeniKayit.Enabled := False;
  btnKaydet.Enabled := True;
  btnDuzenle.Enabled := False;
  btnSil.Enabled := False;

  // kisi deðiþkenine txtÝsim.Text'i atadýk
  kisi := txtÝsim.Text;
end;

procedure TForm1.btnKaydetClick(Sender: TObject);
begin
  // Kaydý post ettik ve tabloyu yeniden yükledik
  ADOTable1.Post;
  ADOTable1.Refresh;

  // Buton durumlarýný güncelledik
  btnYeniKayit.Enabled := True;
  btnKaydet.Enabled := False;
  btnDuzenle.Enabled := True;
  btnSil.Enabled := True;

  // Mesaj kutusu gösterdik
  ShowMessage(txtÝsim.Text + ' kiþisi eklendi!');
end;

procedure TForm1.btnSilClick(Sender: TObject);
begin
  // Silme iþlemini gerçekleþtirdik ve tabloyu yeniden yükledik
  ShowMessage(txtÝsim.Text + ' kiþisi silindi!');
  ADOTable1.Delete;
  ADOTable1.Refresh;
end;

procedure TForm1.btnDuzenleClick(Sender: TObject);
begin
  // Düzenleme moduna geçtik ve tabloyu yeniden yükledik
  ADOTable1.Edit;
  ADOTable1.Refresh;

  // Mesaj kutusu gösterdik
  ShowMessage(txtÝsim.Text + ' kiþisi düzenlendi!');
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  // Metni trimledik
  Edit5.Text := Trim(Edit5.Text);

  // Filtreleme iþlemini gerçekleþtirdik
  ADOTable1.Filtered := False;
  ADOtable1.Filter := 'Ad-Soyad like ' + QuotedStr('%' + Edit5.Text + '%');
  ADOTable1.Filtered := Edit5.Text <> '';
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//Programý zorla kapattýrdýk
Halt;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  // Sistem saat ve tarihini güncelledik
  Label7.Caption := FormatDateTime('dd.mm.yyyy', Now);
  Label8.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
