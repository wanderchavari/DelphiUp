program DelphUp;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  DelphiUp.View.Pages.Index in 'src\view\pages\DelphiUp.View.Pages.Index.pas' {PageIndex},
  DelphiUp.Views.Layouts.Principal in 'src\view\layouts\DelphiUp.Views.Layouts.Principal.pas' {LayoutPrincipal},
  DelphiUp.View.Services.Routers in 'src\view\services\DelphiUp.View.Services.Routers.pas',
  DelphiUp.View.Styles in 'src\view\styles\DelphiUp.View.Styles.pas',
  DelphiUp.View.Components.Button001 in 'src\view\components\DelphiUp.View.Components.Button001.pas' {ComponentButton001},
  DelphUp.View.Pages.Menu.Principal in 'src\view\pages\DelphUp.View.Pages.Menu.Principal.pas' {PageMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.CreateForm(TComponentButton001, ComponentButton001);
  Application.CreateForm(TPageMenuPrincipal, PageMenuPrincipal);
  Application.Run;
end.
