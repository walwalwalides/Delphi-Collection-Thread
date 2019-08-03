{ ============================================
  Software Name : 	HelperThread
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }

unit Helper.Thread;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TProcedureExcept = reference to procedure(const AExceptionMessage: string);

type
  TThreadCustom = class
  private
  var
    FThread: TThread;

  var
    FIsTerminated: Boolean;
  public
    constructor Create();
    destructor Destroy; override;

    property IsTerminated: Boolean read FIsTerminated;

    class function Start(AOnShow, AOnProcess, AOnComplete: TProc;
      AOnError: TProcedureExcept = nil;
      const ADoCompleteWithErro: Boolean = True): TThread;

    function Execute(AOnShow, AOnProcess, AOnComplete: TProc;
      AOnError: TProcedureExcept = nil;
      const ADoCompleteWithErro: Boolean = True): TThread;
    procedure Terminate();
  end;

implementation

{ TThreadCustom }

constructor TThreadCustom.Create();
begin
  FIsTerminated := False;
end;

destructor TThreadCustom.Destroy;
begin
{  if (Assigned(FThread)) then
  begin
      FreeAndNil(FThread);
          FThread := nil;
            end;}
  inherited;
end;

function TThreadCustom.Execute(AOnShow, AOnProcess, AOnComplete: TProc;
  AOnError: TProcedureExcept; const ADoCompleteWithErro: Boolean): TThread;
begin
  FThread := Start(AOnShow, AOnProcess, AOnComplete, AOnError,
    ADoCompleteWithErro);
  Result := FThread;

end;

class function TThreadCustom.Start(AOnShow, AOnProcess, AOnComplete: TProc;
  AOnError: TProcedureExcept; const ADoCompleteWithErro: Boolean): TThread;
begin
  Result := TThread.CreateAnonymousThread(
    procedure
    var
      LDoComplete: Boolean;
    begin
      try
        LDoComplete := True;
        try
          if (Assigned(AOnShow)) then
          begin
            TThread.Synchronize(nil,
              procedure()
              begin
                AOnShow
              end);
          end;

          if (Assigned(AOnProcess)) then
          begin
            AOnProcess;
          end;
        except
          on E: Exception do
          begin
            LDoComplete := ADoCompleteWithErro;
            if (Assigned(AOnError)) then
            begin
              TThread.Synchronize(nil,
                procedure()
                begin
                  AOnError(E.Message);
                end);
            end;
          end;
        end;
      finally
        if (LDoComplete) then
          if (Assigned(AOnComplete)) then
          begin
            TThread.Synchronize(nil,
              procedure()
              begin
                AOnComplete
              end);
          end;
      end;
    end);
  Result.FreeOnTerminate := True;
  Result.Start;
end;

procedure TThreadCustom.Terminate;
begin
  if (Assigned(FThread)) then
  begin
    FThread.Terminate;
    FThread.WaitFor;
    FreeAndNil(FThread);
    FThread := nil;
  end;
  FIsTerminated := True;
end;

end.
