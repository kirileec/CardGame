unit CardGame;
//==============================================================================
// 游戏类
//==============================================================================

interface

uses
  Classes, Contnrs, Card, Deck;

type
  TCardGame = class
  private
    FScore: Integer;
    FFlipCount: Integer;
    FgameCards: TNSArray;
    procedure SetFlipCount(const Value: Integer);
    procedure SetGameCards(const Value: TNSArray);
    procedure SetScore(const Value: Integer);
  published
  public
    property Score: Integer read FScore write SetScore;  //分数
    property FlipCount: Integer read FFlipCount write SetFlipCount; //次数
    property gameCards: TNSArray read FgameCards write SetGameCards; //牌组
    function CardAtIndex(index: Integer): TCard;
    procedure ChooseCardAtIndex(index: Integer);
    procedure AddgameCard(cd: TCard);
    constructor Create(CardCount: Integer; usingdeck: TDeck); overload;
  end;

implementation

{ TCardGame }

procedure TCardGame.AddgameCard(cd: TCard);
begin
  SetLength(FgameCards, Length(FgameCards) + 1);
  FgameCards[High(FgameCards)] := cd;
end;

function TCardGame.CardAtIndex(index: Integer): TCard;
begin
  Result := nil;
  if index < Length(FgameCards) then
  begin
    Result := TCard(FgameCards[index - 1]);
  end;
end;

procedure TCardGame.ChooseCardAtIndex(index: Integer);
var
  i, matchScore: Integer;
  card: TCard;
  othercard: TCard;
begin
  card := CardAtIndex(index);

  if not card.matched then
  begin
    if card.chosen then
    begin
      card.chosen := False;
    end
    else
    begin
      for othercard in self.FgameCards do
      begin
        if ((othercard.chosen) and (not othercard.matched)) then
        begin
          matchScore := card.Match(othercard);
          if matchScore = 2 then
          begin
            //匹配rank
            Inc(Self.FScore, 4);
            card.matched := True;
            othercard.matched := True;

          end
          else if matchScore = 1 then
          begin
            //匹配suit
            Inc(Self.FScore, 2);
            card.matched := True;
            othercard.matched := True;

          end
          else if matchScore = 0 then
          begin
            //不匹配
            Dec(self.FScore, 2);
            othercard.chosen := False;
          end;
          Break;
        end;

      end;
      Dec(self.FScore, 1);
      Inc(self.FFlipCount, 1);
      card.chosen := true;
    end;
  end;
end;

constructor TCardGame.Create(CardCount: Integer; usingdeck: TDeck);
var
  tmpCard: TCard;
  i: Integer;
begin
  inherited Create;

  self.FlipCount := 0;
  for i := 0 to CardCount - 1 do
  begin
    tmpCard := usingdeck.DrawRandomCard;

    if (tmpCard <> nil) then
    begin
      AddgameCard(tmpCard);
    end
    else
    begin
      Self := nil;
    end;
  end;
end;

procedure TCardGame.SetFlipCount(const Value: Integer);
begin
  FFlipCount := Value;
end;

procedure TCardGame.SetGameCards(const Value: TNSArray);
begin
  FgameCards := Value;
end;

procedure TCardGame.SetScore(const Value: Integer);
begin
  FScore := Value;
end;

end.

