unit mainform;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyThread = class (TThread)
  private

  public
    procedure Execute; override;
  end;

  TMyList = class
  private
    FData : string;
    FLock : TObject;
  public
    constructor Create;
    function Lock : string;
    procedure Add(const Item : string);
    procedure Remove;
    procedure UnLock; inline;
  end;

var
  Form1: TForm1;
  MyList : TMyList;
  t1,t2 : TMyThread;

implementation

{$R *.dfm}

{ TMyList }

procedure TMyList.Add(const Item: string);
begin
  FData := Item;
end;

constructor TMyList.Create;
begin
  FLock := TObject.Create;
  FData := Random(900000).ToString
end;

function TMyList.Lock : string;
begin
  System.TMonitor.Enter(FLock);
  Result := FData;

end;

procedure TMyList.Remove;
begin
  FData := '';
end;

procedure TMyList.UnLock;
begin
  System.TMonitor.Exit(FLock);
end;

{ TMyThread }

procedure TMyThread.Execute;
begin
  repeat
    MyList.Lock;
    MyList.Add('t1data '+Self.ThreadID.ToString);
    Synchronize(procedure
    begin
      Form1.Memo1.Lines.Add(Self.ThreadID.ToString+' is change Data');
    end
    );
    sleep(10);

    Synchronize(procedure
    begin
      Form1.Memo1.Lines.Add(Self.ThreadID.ToString+' Done');
    end
    );
    MyList.UnLock;

  until Terminated;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  strItem : string;
begin
  MyList := TMyList.Create;
  MyList.Add('Spec');
  strItem := MyList.Lock;
  MyList.UnLock;
  Memo1.Lines.Add(strItem);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  t1 := TMyThread.Create;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  t2 := TMyThread.Create;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  t1.Terminate;
  t1.WaitFor;
  t2.Terminate;
  t2.WaitFor;
end;

end.
