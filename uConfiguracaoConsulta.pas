unit uConfiguracaoConsulta;

interface

uses
  FireDAC.Comp.Client;

type
  TConfiguracaoConsulta = Record
    NomeTabela: string;
    CampoBusca: string;
    CampoChave: string;
    Caption: string;
  end;

implementation

end.
