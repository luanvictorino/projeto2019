unit uILookUp;

interface

uses
  Data.DB;

type
  ILookUp = interface(IInterface)
    ['{4DF26D75-8D95-4385-BFF2-56E3FBFAE7F8}']
    procedure Executar;
    procedure SetIdCampo(const Value: TField);
    procedure SetNmCampo(const Value: TField);
    function GetIdCampo: TField;
    function GetNmCampo: TField;
    property IdCampo: TField read GetIdCampo write SetIdCampo;
    property NmCampo: TField read GetNmCampo write SetNmCampo;
  end;

implementation

end.
