unit DelphUp.View.Pages.Menu.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.MultiView, DelphiUp.View.Components.Button001, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TPageMenuPrincipal = class(TForm)
    Layout1: TLayout;
  private
    { Private declarations }
    FMultiView : TMultiView;
    procedure MultiViewStatus(Sender: TObject);
  public
    { Public declarations }
    function Component : TFMXObject;
    function MultiView(AValue: TMultiView): TPageMenuPrincipal;
  end;

var
  PageMenuPrincipal : TPageMenuPrincipal;

implementation

{$R *.fmx}

{ TPageMenuPrincipal }

function TPageMenuPrincipal.Component: TFMXObject;
begin
  Result := Layout1;

  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Image('ico_home')
      .OnClick(MultiViewStatus)
      .Component
  );
  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Image('ico_chart')
      .OnClick(MultiViewStatus)
      .Component
  );
  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Image('ico_money')
      .OnClick(MultiViewStatus)
      .Component
  );
  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Image('ico_cart')
      .OnClick(MultiViewStatus)
      .Component
  );
  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Image('ico_sale')
      .OnClick(MultiViewStatus)
      .Component
  );
  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Image('ico_scanner')
      .OnClick(MultiViewStatus)
      .Component
  );
  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Image('ico_star')
      .OnClick(MultiViewStatus)
      .Component
  );

end;

function TPageMenuPrincipal.MultiView(AValue: TMultiView): TPageMenuPrincipal;
begin
  Result := Self;
  FMultiView := AValue;
end;

procedure TPageMenuPrincipal.MultiViewStatus(Sender: TObject);
begin
  if not FMultiView.IsShowed then
    FMultiView.ShowMaster;
end;

end.
