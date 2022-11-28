program ReviewAPIDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  ReviewAPIDemo.Unit1 in 'ReviewAPIDemo.Unit1.pas' {FormReviewAPI};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormReviewAPI, FormReviewAPI);
  Application.Run;
end.
