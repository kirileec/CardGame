unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Card,Deck, CardGame;

type
  TForm1 = class(TForm)
    Button1: TSpeedButton;
    Button2: TSpeedButton;
    Button3: TSpeedButton;
    Button4: TSpeedButton;
    Button5: TSpeedButton;
    Button6: TSpeedButton;
    Button7: TSpeedButton;
    Button8: TSpeedButton;
    Button9: TSpeedButton;
    Button10: TSpeedButton;
    Button11: TSpeedButton;
    Button12: TSpeedButton;
    Button13: TSpeedButton;
    Button14: TSpeedButton;
    Button15: TSpeedButton;
    Button16: TSpeedButton;
    Button17: TSpeedButton;
    Button18: TSpeedButton;
    Button19: TSpeedButton;
    Button20: TSpeedButton;
    procedure ClickButton(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpdateUI(CardIndex: Integer);
    function TitleForCard(tmpCard: TCard): string;
    function GetButtonIndex(sender: TObject): Integer;
    function GetButton(index:Integer):TSpeedButton;
  private
    FMainDeck: TDeck;
    FMainGame: TCardGame;
    imgback,imgfront:TBitmap ;
    procedure SetMainDeck(const Value: TDeck);
    procedure SetMainGame(const Value: TCardGame);
    { Private declarations }
  public
    { Public declarations }
    property mainDeck: TDeck read FMainDeck write SetMainDeck;
    property mainGame: TCardGame read FMainGame write SetMainGame;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.ClickButton(Sender: TObject);
begin
//
  Self.mainGame.ChooseCardAtIndex(GetButtonIndex(Sender));
  self.UpdateUI(GetButtonIndex(Sender));

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    //init game
  Self.mainDeck := TDeck.Create;
  self.mainGame := TCardGame.Create(21, FMainDeck);

   imgback:=TBitmap.Create ;
   imgfront := TBitmap.Create ;
imgfront.LoadFromFile(ExtractFilePath(Application.ExeName)+'\res\front.bmp');
 imgback.LoadFromFile(ExtractFilePath(Application.ExeName)+'\res\back.bmp');

end;

function TForm1.GetButton(index: Integer): TSpeedButton;
begin
   case index of
    1:
      Result := Form1.Button1;
    2:
      Result := Form1.Button2;
    3:
      Result := Form1.Button3;
    4:
      Result := Form1.Button4;
    5:
      Result := Form1.Button5;
    6:
      Result := Form1.Button6;
    7:
      Result := Form1.Button7;
    8:
      Result := Form1.Button8;
    9:
      Result := Form1.Button9;
    10:
      Result := Form1.Button10;
    11:
      Result := Form1.Button11;
    12:
      Result := Form1.Button12;
    13:
      Result := Form1.Button13;
    14:
      Result := Form1.Button14;
    15:
      Result := Form1.Button15;
    16:
      Result := Form1.Button16;
    17:
      Result := Form1.Button17;
    18:
      Result := Form1.Button18;
    19:
      Result := Form1.Button19;
    20:
      Result := Form1.Button20;
  end;
end;

function TForm1.GetButtonIndex(sender: TObject): Integer;
begin
//
  Result := TSpeedButton(sender).Tag;
end;


procedure TForm1.SetMainDeck(const Value: TDeck);
begin
  FMainDeck := Value;
end;

procedure TForm1.SetMainGame(const Value: TCardGame);
begin
  FMainGame := Value;
end;

function TForm1.TitleForCard(tmpCard: TCard): string;

begin
   //

   Result := '';
   if tmpCard.FChosen  then
   begin

      Result := tmpCard.GetContents ;
   end;

end;

procedure TForm1.UpdateUI(CardIndex: Integer);
var
  i, j: Integer;
  card: TCard;
  btn: TSpeedButton;
begin
  i:=1;


  for i := 1 to 20 do
  begin
    card :=TCard( FMainGame.CardAtIndex(i));
    btn := GetButton(i);


    btn.Caption := TitleForCard(card);
    if btn.Caption = '' then
    begin
       btn.Glyph := imgback ;
    end else begin
      btn.Glyph := nil    ;
    end;
    btn.Enabled := not card.matched ;
  end;
  Form1.Caption := '分数：' + IntToStr(FMainGame.Score) +'---'+'翻牌次数: ' + IntToStr(FMainGame.FlipCount );

end;

end.

