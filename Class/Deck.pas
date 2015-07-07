unit Deck;
//==============================================================================
// 牌组类
//==============================================================================

interface

uses Card,Dialogs,Classes,Contnrs,Variants  ;

type
  TDeck = class
  private
    FCards: TNSArray;
    procedure SetCards(const Value: TNSArray);


  published
    public
      property Cards:TNSArray read FCards write SetCards; //牌组

      procedure AddCard(card:TCard );
      function DrawRandomCard:TCard;   //随机抽牌

      constructor Create;overload ;

  end;
implementation

{ TDeck }

procedure DeleteArrayItem(var arr:TNSArray ;index:Integer);
var
  Count:Cardinal ;
begin
   Count := Length(arr);
   if (Count = 0 ) or (index<0) or (index >= Count) then Exit;
   Move(arr[index+1],arr[index],(Count-Index)*SizeOf(arr[0]));
   SetLength(arr,Count-1);
end;

procedure TDeck.AddCard(card: TCard);
begin
    SetLength(FCards,Length(FCards)+1);
    FCards[High(FCards)]:= card ;
end;

constructor TDeck.Create;
var
  i,j:Integer;
  tmpCard:TCard;
begin
    inherited ;
    //产生一副牌
    if  Self <> nil then
    begin
      for I := 1 to 4 do
      begin
         for j := 1 to 13 do
         begin
             tmpCard := TCard.Create ;
             tmpCard.suit := i;
             tmpCard.rank := j;

             AddCard(tmpCard);
         end;
      end;
    end;


end;

function TDeck.DrawRandomCard: TCard;
var
  randIndex:Integer;
begin
    Result := nil;
    if Length(FCards) <> 0 then
    begin
      Randomize ;
      randIndex := Random(Length(FCards));
      Result := FCards[randIndex];
      DeleteArrayItem(FCards ,randIndex );
    end;
end;

procedure TDeck.SetCards(const Value: TNSArray);
begin
  FCards := Value;
end;

end.
