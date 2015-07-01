program Project1;



uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Card in 'Class\Card.pas',
  Deck in 'Class\Deck.pas',
  CardGame in 'Class\CardGame.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
