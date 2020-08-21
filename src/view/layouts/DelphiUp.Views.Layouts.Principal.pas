unit DelphiUp.Views.Layouts.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Router4D.Interfaces, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects, DelphiUp.View.Styles, FMX.MultiView,
  DelphUp.View.Pages.Menu.Principal;

type
  TLayoutPrincipal = class(TForm, iRouter4DComponent)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Layout5: TLayout;
    MultiView1: TMultiView;
    Rectangle5: TRectangle;
  private
    { Private declarations }
    procedure ApplyStyle;
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  LayoutPrincipal: TLayoutPrincipal;

implementation

{$R *.fmx}

{ TLayoutPrincipal }

procedure TLayoutPrincipal.ApplyStyle;
begin
  Rectangle1.Fill.Color := BACKGROUND;
  Rectangle2.Fill.Color := DARK;
  Rectangle3.Fill.Color := PRIMARY;
  Rectangle4.Fill.Color := LIGHT;
  Rectangle5.Fill.Color := PRIMARY;
end;

function TLayoutPrincipal.Render: TFMXObject;
begin
  Result := Layout1;
  ApplyStyle;

  Layout2.AddObject(
    TPageMenuPrincipal
      .Create(Self)
      .MultiView(MultiView1)
      .Component
  );

end;

procedure TLayoutPrincipal.UnRender;
begin

end;

end.
