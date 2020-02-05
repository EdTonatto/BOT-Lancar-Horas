[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program

[Code]
#ifdef UNICODE
  #define AW "W"
#else
  #define AW "A"
#endif
const
  NO_ERROR = 0;
  ERROR_ACCESS_DENIED = 5;
  ERROR_BAD_NET_NAME = 67;
  ERROR_ALREADY_ASSIGNED = 85;
  ERROR_INVALID_PASSWORD = 86;
  ERROR_INVALID_PARAMETER = 87;
  ERROR_MORE_DATA = 234;
  ERROR_NO_MORE_ITEMS = 259;
  ERROR_INVALID_ADDRESS = 487;
  ERROR_BAD_DEVICE = 1200;
  ERROR_NO_NET_OR_BAD_PATH = 1203;
  ERROR_BAD_PROVIDER = 1204;
  ERROR_EXTENDED_ERROR = 1208;
  ERROR_NO_NETWORK = 1222;
  ERROR_CANCELLED = 1223;
  RESOURCETYPE_ANY = $00000000;
  RESOURCETYPE_DISK = $00000001;
  RESOURCETYPE_PRINT = $00000002;
  CONNECT_UPDATE_PROFILE = $00000001;
  CONNECT_INTERACTIVE = $00000008;
  CONNECT_PROMPT = $00000010;
  CONNECT_REDIRECT = $00000080;
  CONNECT_COMMANDLINE = $00000800;
  CONNECT_CMD_SAVECRED = $00001000;
type
  TNetResource = record
    dwScope: DWORD;
    dwType: DWORD;
    dwDisplayType: DWORD;
    dwUsage: DWORD;
    lpLocalName: string;
    lpRemoteName: string;
    lpComment: string;
    lpProvider: string;
  end;
  TResourceType = (
    rtAny,
    rtDisk,
    rtPrinter
  );

function WNetUseConnection(hwndOwner: HWND; const lpNetResource: TNetResource;
  lpPassword, lpUserID: string; dwFlags: DWORD; lpAccessName: PAnsiChar;
  var lpBufferSize, lpResult: DWORD): DWORD;
  external 'WNetUseConnection{#AW}@mpr.dll stdcall';

function UseConnection(const ARemoteName: string; 
  AResourceType: TResourceType): DWORD;
var
  BufferSize: DWORD;
  ResultFlag: DWORD;
  NetResource: TNetResource;
begin
  case AResourceType of
    rtAny: NetResource.dwType := RESOURCETYPE_ANY;
    rtDisk: NetResource.dwType := RESOURCETYPE_DISK;
    rtPrinter: NetResource.dwType := RESOURCETYPE_PRINT;
  end;
  NetResource.lpLocalName := '';
  NetResource.lpRemoteName := ARemoteName;
  NetResource.lpProvider := '';  
  BufferSize := 0;
  Result := WNetUseConnection(WizardForm.Handle, NetResource,
    '', '', CONNECT_INTERACTIVE or CONNECT_PROMPT, '',
    BufferSize, ResultFlag); 
end;

procedure UseConnectionButtonClick(Sender: TObject);
var
  S: string;
  ResultCode: DWORD;
begin
  ResultCode := UseConnection('\\MySuperSecret\Place', rtDisk);
  case ResultCode of
    NO_ERROR: S := 'NO_ERROR';
    ERROR_ACCESS_DENIED: S := 'ERROR_ACCESS_DENIED';
    ERROR_ALREADY_ASSIGNED: S := 'ERROR_ALREADY_ASSIGNED';
    ERROR_BAD_DEVICE: S := 'ERROR_BAD_DEVICE';
    ERROR_BAD_NET_NAME: S := 'ERROR_BAD_NET_NAME';
    ERROR_BAD_PROVIDER: S := 'ERROR_BAD_PROVIDER';
    ERROR_CANCELLED: S := 'ERROR_CANCELLED';
    ERROR_EXTENDED_ERROR: S := 'ERROR_EXTENDED_ERROR';
    ERROR_INVALID_ADDRESS: S := 'ERROR_INVALID_ADDRESS';
    ERROR_INVALID_PARAMETER: S := 'ERROR_INVALID_PARAMETER';
    ERROR_MORE_DATA: S := 'ERROR_MORE_DATA';
    ERROR_INVALID_PASSWORD: S := 'ERROR_INVALID_PASSWORD';
    ERROR_NO_MORE_ITEMS: S := 'ERROR_NO_MORE_ITEMS';
    ERROR_NO_NET_OR_BAD_PATH: S := 'ERROR_NO_NET_OR_BAD_PATH';
    ERROR_NO_NETWORK: S := 'ERROR_NO_NETWORK';
  end;
  MsgBox(S, mbInformation, MB_OK);
end;

procedure InitializeWizard;
var
  UseConnectionButton: TNewButton;
begin
  UseConnectionButton := TNewButton.Create(WizardForm);
  UseConnectionButton.Parent := WizardForm;
  UseConnectionButton.Left := 8;
  UseConnectionButton.Top := WizardForm.ClientHeight - UseConnectionButton.Height - 8;
  UseConnectionButton.Width := 155;
  UseConnectionButton.Caption := 'Use connection...';
  UseConnectionButton.OnClick := @UseConnectionButtonClick;
end;