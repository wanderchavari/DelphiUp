unit DelphiUp.View.Components.Button001;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.Effects, FMX.Filter.Effects, DelphiUp.View.Styles,
  Router4D.Props;

type
  TComponentButton001 = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
  private
    { Private declarations }
    FImage : String;
    FOnClick: TProc<TObject>;
    FClicked : Boolean;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Image(AValue: String): TComponentButton001;
    function OnClick(AValue: TProc<TObject>): TComponentButton001;

    [Subscribe]
    procedure Props(AValue: TProps);
  end;

var
  ComponentButton001: TComponentButton001;

implementation

{$R *.fmx}

function TComponentButton001.Component: TFMXObject;
begin
  Result := Layout1;
  Layout1.Align := TAlignLayout.Top;
  FillRGBEffect1.Color := WHITE;
  FClicked := False;
  GlobalEventBus.RegisterSubscriber(Self);
end;

function TComponentButton001.Image(AValue: String): TComponentButton001;
var
  Resource : TResourceStream;
begin
  Result := Self;
  FImage := AValue;

  Resource := TResourceStream.Create(HInstance, AValue, RT_RCDATA);
  try
    Image1.Bitmap.LoadFromStream(Resource);
  finally
    Resource.Free;
  end;
end;

function TComponentButton001.OnClick(
  AValue: TProc<TObject>): TComponentButton001;
begin
  Result := Self;
  FOnClick := AValue;
end;

procedure TComponentButton001.Props(AValue: TProps);
begin
  FClicked := False;
  if AValue.Key = 'Button001' then
    if AValue.PropString = FImage then
      FClicked := True
    else
      FillRGBEffect1.Color := WHITE;

end;

procedure TComponentButton001.SpeedButton1Click(Sender: TObject);
begin
  if Assigned(FOnClick) then
    FOnClick(Sender);

  GlobalEventBus.Post(TProps.Create.PropString(FImage).Key('Button001'));
end;

procedure TComponentButton001.SpeedButton1MouseEnter(Sender: TObject);
begin
  FillRGBEffect1.Color := INFO;
end;

procedure TComponentButton001.SpeedButton1MouseLeave(Sender: TObject);
begin
  if not FClicked then
    FillRGBEffect1.Color := WHITE;
end;

end.
