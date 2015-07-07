unit Card;
//==============================================================================
// 单一卡牌类
//==============================================================================


interface

uses
  Contnrs, Dialogs, Classes;

type
  TCard = class
  private

    procedure SetChosen(const Value: Boolean);
    procedure SetMatched(const Value: Boolean);
    procedure SetRank(const Value: Integer);
    procedure SetSuit(const Value: Integer);
    //返回牌值
    function rankstr(index: Integer): string;
    //返回花色
    function suitstr(index: Integer): string;
  published
  public
    FRank: Integer;     //牌值
    Fmatched: Boolean;   //匹配
    FSuit: Integer;       //花色
    FChosen: Boolean;     //选中
    property matched: Boolean read Fmatched write SetMatched;
    property chosen: Boolean read FChosen write SetChosen;
    property rank: Integer read FRank write SetRank;
    property suit: Integer read FSuit write SetSuit;
    //获取牌面
    function GetContents: string;
    //匹配方法
    function Match(OtherCard: TCard): Integer;
  end;
  //牌组
  TNSArray = array of TCard ;

implementation

{ TCard }

function TCard.GetContents: string;
begin
  Result := Self.rankstr(rank) + Self.suitstr(suit);
end;

function TCard.Match(OtherCard: TCard): Integer;
begin
  Result := 0;
  if Self.rank = OtherCard.rank then
  begin
    Result := 1;
  end
  else if self.suit = OtherCard.suit then
  begin
    Result := 2;
  end;

end;

function TCard.rankstr(index: Integer): string;
begin

  case index of
    1:
      Result := 'A';
    2:
      Result := '2';
    3:
      Result := '3';
    4:
      Result := '4';
    5:
      Result := '5';
    6:
      Result := '6';
    7:
      Result := '7';
    8:
      Result := '8';
    9:
      Result := '9';
    10:
      Result := '10';
    11:
      Result := 'J';
    12:
      Result := 'Q';
    13:
      Result := 'K';

  end;
end;

procedure TCard.SetChosen(const Value: Boolean);
begin
  FChosen := Value;
end;

procedure TCard.SetMatched(const Value: Boolean);
begin
  Fmatched := Value;
end;

procedure TCard.SetRank(const Value: Integer);
begin
  FRank := Value;
end;

procedure TCard.SetSuit(const Value: Integer);
begin
  FSuit := Value;
end;

function TCard.suitstr(index: Integer): string;
begin
   Result := '';
    case  index of
      1: Result := '♠';
      2: Result := '♥';
      3: Result := '♣';
      4: Result := '♦';
    end;
end;

end.

