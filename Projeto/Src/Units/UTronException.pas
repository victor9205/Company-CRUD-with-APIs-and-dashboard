unit UTronException;

interface

uses SysUtils;

type
  ETronException = class(Exception)
  end;

  EPersistentException = class(ETronException)
  end;

  EContaException = class(EPersistentException)
  end;

  ELimiteEnquadramentoException = class(ETronException)
  end;

  ESaldoContaException = class(ETronException)
  end;

  EInicializacaoPeriodoContabilException = class(ETronException)
  end;

  EFiltroException = class(ETronException)
  end;

  EExportException = class(ETronException)
  end;

  EImportException = class(ETronException)
  end;

  EAtualizaException = class(ETronException)
  end;  

  ELoadNfeException = class(EImportException)
  end;

  ELicenceException = class(ETronException)
  end;

  EInvalidImportSelection = class(EImportException)
  end;

implementation

end. 
