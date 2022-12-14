-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- SER.dbo.Academia definition

-- Drop table

-- DROP TABLE SER.dbo.Academia;

CREATE TABLE SER.dbo.Academia (
	AcademiaID int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Academia PRIMARY KEY (AcademiaID)
);


-- SER.dbo.Alumno definition

-- Drop table

-- DROP TABLE SER.dbo.Alumno;

CREATE TABLE SER.dbo.Alumno (
	CorreoElectronico varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Matricula varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Alumno PRIMARY KEY (Matricula)
);


-- SER.dbo.Archivo definition

-- Drop table

-- DROP TABLE SER.dbo.Archivo;

CREATE TABLE SER.dbo.Archivo (
	NombreArchivo varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdArchivo int IDENTITY(0,1) NOT NULL,
	Direccion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdFuente int NOT NULL,
	CONSTRAINT NewTable_PK PRIMARY KEY (IdArchivo)
);


-- SER.dbo.Integrante definition

-- Drop table

-- DROP TABLE SER.dbo.Integrante;

CREATE TABLE SER.dbo.Integrante (
	NumeroDePersonal varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tipo varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IntegranteID int IDENTITY(1,1) NOT NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Integrante PRIMARY KEY (IntegranteID)
);


-- SER.dbo.Lgac definition

-- Drop table

-- DROP TABLE SER.dbo.Lgac;

CREATE TABLE SER.dbo.Lgac (
	Descripcion varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	LgacID int IDENTITY(1,1) NOT NULL,
	CuerpoAcademicoID int NULL,
	CONSTRAINT PK_Lgac PRIMARY KEY (LgacID)
);


-- SER.dbo.Pladeafei definition

-- Drop table

-- DROP TABLE SER.dbo.Pladeafei;

CREATE TABLE SER.dbo.Pladeafei (
	Accion varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ObjetivoGeneral varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Periodo varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PladeafeiID int IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK_Pladeafei PRIMARY KEY (PladeafeiID)
);


-- SER.dbo.Profesor definition

-- Drop table

-- DROP TABLE SER.dbo.Profesor;

CREATE TABLE SER.dbo.Profesor (
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	NombreUsuario varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	NumeroDePersonal varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProfesorID int IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK_Profesor PRIMARY KEY (ProfesorID)
);


-- SER.dbo.ProyectoDeInvestigacion definition

-- Drop table

-- DROP TABLE SER.dbo.ProyectoDeInvestigacion;

CREATE TABLE SER.dbo.ProyectoDeInvestigacion (
	FechaInicio date NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProyectoDeInvestigacionID int IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK_ProyectoDeInvestigacion PRIMARY KEY (ProyectoDeInvestigacionID)
);


-- SER.dbo.SinodalDelTrabajo definition

-- Drop table

-- DROP TABLE SER.dbo.SinodalDelTrabajo;

CREATE TABLE SER.dbo.SinodalDelTrabajo (
	CorreoElectronico varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Organizacion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Telefono varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SinodalDelTrabajoID int IDENTITY(1,1) NOT NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	NumeroDePersonal int NULL,
	CONSTRAINT PK_SinodalDelTrabajo PRIMARY KEY (SinodalDelTrabajoID)
);


-- SER.dbo.TipoDocumento definition

-- Drop table

-- DROP TABLE SER.dbo.TipoDocumento;

CREATE TABLE SER.dbo.TipoDocumento (
	NombreDocumento varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ExperienciaEducativa varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdTipo int IDENTITY(0,1) NOT NULL,
	CONSTRAINT TipoDocumento_PK PRIMARY KEY (IdTipo)
);


-- SER.dbo.Usuario definition

-- Drop table

-- DROP TABLE SER.dbo.Usuario;

CREATE TABLE SER.dbo.Usuario (
	NombreUsuario varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Contra varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tipo varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdUsuario int IDENTITY(0,1) NOT NULL,
	CONSTRAINT Usuario_PK PRIMARY KEY (IdUsuario)
);


-- SER.dbo.Vinculacion definition

-- Drop table

-- DROP TABLE SER.dbo.Vinculacion;

CREATE TABLE SER.dbo.Vinculacion (
	FechaDeInicioDeConvenio date NULL,
	OrganizacionVinculada varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	VinculacionID int IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK_Vinculacion PRIMARY KEY (VinculacionID)
);


-- SER.dbo.[__EFMigrationsHistory] definition

-- Drop table

-- DROP TABLE SER.dbo.[__EFMigrationsHistory];

CREATE TABLE SER.dbo.[__EFMigrationsHistory] (
	MigrationId nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ProductVersion nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK___EFMigrationsHistory PRIMARY KEY (MigrationId)
);


-- SER.dbo.CuerpoAcademico definition

-- Drop table

-- DROP TABLE SER.dbo.CuerpoAcademico;

CREATE TABLE SER.dbo.CuerpoAcademico (
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Objetivogeneral varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CuerpoAcademicoID int IDENTITY(1,1) NOT NULL,
	AcademiaID int NOT NULL,
	CONSTRAINT PK_CuerpoacAdemico PRIMARY KEY (CuerpoAcademicoID),
	CONSTRAINT FK_Cuerpoacademico_Academia FOREIGN KEY (AcademiaID) REFERENCES SER.dbo.Academia(AcademiaID)
);


-- SER.dbo.CuerpoAcademicoIntegrante definition

-- Drop table

-- DROP TABLE SER.dbo.CuerpoAcademicoIntegrante;

CREATE TABLE SER.dbo.CuerpoAcademicoIntegrante (
	CuerpoAcademicoID int NOT NULL,
	IntegranteID int NOT NULL,
	CONSTRAINT PK_CuerpoAcademicoIntegrante PRIMARY KEY (CuerpoAcademicoID,IntegranteID),
	CONSTRAINT FK_CuerpoAcademicoIntegrante_CuerpoAcademico FOREIGN KEY (CuerpoAcademicoID) REFERENCES SER.dbo.CuerpoAcademico(CuerpoAcademicoID),
	CONSTRAINT FK_CuerpoAcademicoIntegrante_Integrante FOREIGN KEY (IntegranteID) REFERENCES SER.dbo.Integrante(IntegranteID)
);


-- SER.dbo.ExperienciaEducativa definition

-- Drop table

-- DROP TABLE SER.dbo.ExperienciaEducativa;

CREATE TABLE SER.dbo.ExperienciaEducativa (
	EstadoAbierto int NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Nrc varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Periodo varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Seccion varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ExperienciaEducativaID int IDENTITY(1,1) NOT NULL,
	ProfesorID int NULL,
	CONSTRAINT PK_ExperienciaEducativa PRIMARY KEY (ExperienciaEducativaID),
	CONSTRAINT FK_ExperienciaEducativa_Profesor FOREIGN KEY (ProfesorID) REFERENCES SER.dbo.Profesor(ProfesorID)
);


-- SER.dbo.PladeafeiLgac definition

-- Drop table

-- DROP TABLE SER.dbo.PladeafeiLgac;

CREATE TABLE SER.dbo.PladeafeiLgac (
	PladeafeiID int NOT NULL,
	LgacID int NOT NULL,
	CONSTRAINT PK_PladeafeiLgac PRIMARY KEY (PladeafeiID,LgacID),
	CONSTRAINT FK_PladeafeiLgac_Pladeafei FOREIGN KEY (PladeafeiID) REFERENCES SER.dbo.Pladeafei(PladeafeiID),
	CONSTRAINT FK_PladeafeiLgac_lgac FOREIGN KEY (LgacID) REFERENCES SER.dbo.Lgac(LgacID)
);


-- SER.dbo.PlanDeCurso definition

-- Drop table

-- DROP TABLE SER.dbo.PlanDeCurso;

CREATE TABLE SER.dbo.PlanDeCurso (
	ObjetivoGeneral varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PlanDeCursoID int IDENTITY(1,1) NOT NULL,
	ExperienciaEducativaID int NOT NULL,
	CONSTRAINT PK_PlanDeCurso PRIMARY KEY (PlanDeCursoID),
	CONSTRAINT FK_PlanDeCurso_ExperienciaEducativa FOREIGN KEY (ExperienciaEducativaID) REFERENCES SER.dbo.ExperienciaEducativa(ExperienciaEducativaID)
);


-- SER.dbo.PlanDeTrabajo definition

-- Drop table

-- DROP TABLE SER.dbo.PlanDeTrabajo;

CREATE TABLE SER.dbo.PlanDeTrabajo (
	FechaDeAprobacion date NULL,
	PeriodoEscolar varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PlanDeTrabajoID int IDENTITY(1,1) NOT NULL,
	AcademiaID int NULL,
	CONSTRAINT PK_PlanDeTrabajo PRIMARY KEY (PlanDeTrabajoID),
	CONSTRAINT FK_PlanDeTrabajo_Academia FOREIGN KEY (AcademiaID) REFERENCES SER.dbo.Academia(AcademiaID)
);


-- SER.dbo.ProyectoDeInvestigacionLgac definition

-- Drop table

-- DROP TABLE SER.dbo.ProyectoDeInvestigacionLgac;

CREATE TABLE SER.dbo.ProyectoDeInvestigacionLgac (
	ProyectoDeInvestigacionID int NOT NULL,
	LgacID int NOT NULL,
	CONSTRAINT PK_ProyectoDeInvestigacionLgac PRIMARY KEY (ProyectoDeInvestigacionID,LgacID),
	CONSTRAINT FK_ProyectoDeInvestigacionLgac_Lgac FOREIGN KEY (LgacID) REFERENCES SER.dbo.Lgac(LgacID),
	CONSTRAINT FK_ProyectoDeInvestigacionLgac_ProyectoDeInvestigacion FOREIGN KEY (ProyectoDeInvestigacionID) REFERENCES SER.dbo.ProyectoDeInvestigacion(ProyectoDeInvestigacionID)
);


-- SER.dbo.TrabajoRecepcional definition

-- Drop table

-- DROP TABLE SER.dbo.TrabajoRecepcional;

CREATE TABLE SER.dbo.TrabajoRecepcional (
	TrabajoRecepcionalID int IDENTITY(1,1) NOT NULL,
	Estado varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fechadeinicio date NULL,
	LineaDeInvestigacion varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Modalidad varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	AcademiaID int NULL,
	PladeafeiID int NULL,
	ProyectoDeInvestigacionID int NULL,
	VinculacionID int NULL,
	CONSTRAINT PK_TrabajoRecepcional PRIMARY KEY (TrabajoRecepcionalID),
	CONSTRAINT FK_TrabajoRecepcional_Academia FOREIGN KEY (AcademiaID) REFERENCES SER.dbo.Academia(AcademiaID),
	CONSTRAINT FK_TrabajoRecepcional_Pladeafei FOREIGN KEY (PladeafeiID) REFERENCES SER.dbo.Pladeafei(PladeafeiID),
	CONSTRAINT FK_TrabajoRecepcional_ProyectoDeInvestigacion FOREIGN KEY (ProyectoDeInvestigacionID) REFERENCES SER.dbo.ProyectoDeInvestigacion(ProyectoDeInvestigacionID),
	CONSTRAINT FK_TrabajoRecepcional_Vinculacion FOREIGN KEY (VinculacionID) REFERENCES SER.dbo.Vinculacion(VinculacionID)
);


-- SER.dbo.TrabajoRecepcionalIntegrante definition

-- Drop table

-- DROP TABLE SER.dbo.TrabajoRecepcionalIntegrante;

CREATE TABLE SER.dbo.TrabajoRecepcionalIntegrante (
	IntegranteID int NOT NULL,
	TrabajoRecepcionalID int NOT NULL,
	CONSTRAINT PK_TrabajoRecepcionalIntegrante PRIMARY KEY (IntegranteID,TrabajoRecepcionalID),
	CONSTRAINT FK_TrabajoRecepcionalIntegrante_Integrante FOREIGN KEY (IntegranteID) REFERENCES SER.dbo.Integrante(IntegranteID),
	CONSTRAINT FK_TrabajoRecepcionalIntegrante_TrabajoRecepcional FOREIGN KEY (TrabajoRecepcionalID) REFERENCES SER.dbo.TrabajoRecepcional(TrabajoRecepcionalID)
);


-- SER.dbo.TrabajoRecepcionalSinodalDelTrabajo definition

-- Drop table

-- DROP TABLE SER.dbo.TrabajoRecepcionalSinodalDelTrabajo;

CREATE TABLE SER.dbo.TrabajoRecepcionalSinodalDelTrabajo (
	SinodalDelTrabajoID int NOT NULL,
	TrabajoRecepcionalID int NOT NULL,
	TipoSinodal varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_TrabajoRecepcionalSinodalDelTrabajo PRIMARY KEY (SinodalDelTrabajoID,TrabajoRecepcionalID),
	CONSTRAINT FK_TrabajoRecepcionalSinodalDelTrabajo_SinodalDelTrabajo FOREIGN KEY (SinodalDelTrabajoID) REFERENCES SER.dbo.SinodalDelTrabajo(SinodalDelTrabajoID),
	CONSTRAINT FK_TrabajoRecepcionalSinodalDelTrabajo_TrabajoRecepcional FOREIGN KEY (TrabajoRecepcionalID) REFERENCES SER.dbo.TrabajoRecepcional(TrabajoRecepcionalID)
);


-- SER.dbo.VinculacionLgac definition

-- Drop table

-- DROP TABLE SER.dbo.VinculacionLgac;

CREATE TABLE SER.dbo.VinculacionLgac (
	VinculacionID int NOT NULL,
	LgacID int NOT NULL,
	CONSTRAINT PK_VinculacionLgac PRIMARY KEY (VinculacionID,LgacID),
	CONSTRAINT FK_VinculacionLgac_Lgac FOREIGN KEY (LgacID) REFERENCES SER.dbo.Lgac(LgacID),
	CONSTRAINT FK_VinculacionLgac_Vinculacion FOREIGN KEY (VinculacionID) REFERENCES SER.dbo.Vinculacion(VinculacionID)
);


-- SER.dbo.AlumnoExperienciaEducativa definition

-- Drop table

-- DROP TABLE SER.dbo.AlumnoExperienciaEducativa;

CREATE TABLE SER.dbo.AlumnoExperienciaEducativa (
	AlumnoID varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ExperienciaEducativaID int NOT NULL,
	CONSTRAINT PK_AlumnoExperienciaEducativa PRIMARY KEY (AlumnoID,ExperienciaEducativaID),
	CONSTRAINT FK_AlumnoExperienciaEducativa_Alumno FOREIGN KEY (AlumnoID) REFERENCES SER.dbo.Alumno(Matricula),
	CONSTRAINT FK_AlumnoExperienciaEducativa_ExperienciaEducativa FOREIGN KEY (ExperienciaEducativaID) REFERENCES SER.dbo.ExperienciaEducativa(ExperienciaEducativaID)
);


-- SER.dbo.AlumnoTrabajoRecepcional definition

-- Drop table

-- DROP TABLE SER.dbo.AlumnoTrabajoRecepcional;

CREATE TABLE SER.dbo.AlumnoTrabajoRecepcional (
	AlumnoID varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	TrabajoRecepcionalID int NOT NULL,
	CONSTRAINT PK_AlumnoTrabajoRecepcional PRIMARY KEY (AlumnoID,TrabajoRecepcionalID),
	CONSTRAINT FK_AlumnoTrabajoRecepcional_Alumno FOREIGN KEY (AlumnoID) REFERENCES SER.dbo.Alumno(Matricula),
	CONSTRAINT FK_AlumnoTrabajoRecepcional_TrabajoRecepcional FOREIGN KEY (TrabajoRecepcionalID) REFERENCES SER.dbo.TrabajoRecepcional(TrabajoRecepcionalID)
);


-- SER.dbo.Direccion definition

-- Drop table

-- DROP TABLE SER.dbo.Direccion;

CREATE TABLE SER.dbo.Direccion (
	FechaInicio date NULL,
	Tipo varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DireccionID int IDENTITY(1,1) NOT NULL,
	ExperienciaEducativaID int NOT NULL,
	CONSTRAINT PK_Direccion PRIMARY KEY (DireccionID),
	CONSTRAINT FK_Direccion_ExperienciaEducativa FOREIGN KEY (ExperienciaEducativaID) REFERENCES SER.dbo.ExperienciaEducativa(ExperienciaEducativaID)
);


-- SER.dbo.DireccionIntegrante definition

-- Drop table

-- DROP TABLE SER.dbo.DireccionIntegrante;

CREATE TABLE SER.dbo.DireccionIntegrante (
	DireccionID int NOT NULL,
	IntegranteID int NOT NULL,
	CONSTRAINT PK_DireccionIntegrante PRIMARY KEY (DireccionID,IntegranteID),
	CONSTRAINT FK_DireccionIntegrante_Direccion FOREIGN KEY (DireccionID) REFERENCES SER.dbo.Direccion(DireccionID),
	CONSTRAINT FK_DireccionIntegrante_Integrante FOREIGN KEY (IntegranteID) REFERENCES SER.dbo.Integrante(IntegranteID)
);


-- SER.dbo.DireccionSinodalDelTrabajo definition

-- Drop table

-- DROP TABLE SER.dbo.DireccionSinodalDelTrabajo;

CREATE TABLE SER.dbo.DireccionSinodalDelTrabajo (
	DireccionID int NOT NULL,
	SinodalDelTrabajoID int NOT NULL,
	CONSTRAINT PK_DireccionSinodalDeTrabajo PRIMARY KEY (DireccionID,SinodalDelTrabajoID),
	CONSTRAINT FK_DireccionSinodalDelTrabajo_Direccion FOREIGN KEY (DireccionID) REFERENCES SER.dbo.Direccion(DireccionID),
	CONSTRAINT FK_DireccionSinodalDelTrabajo_SinodalDelTrabajo FOREIGN KEY (SinodalDelTrabajoID) REFERENCES SER.dbo.SinodalDelTrabajo(SinodalDelTrabajoID)
);


-- SER.dbo.Documento definition

-- Drop table

-- DROP TABLE SER.dbo.Documento;

CREATE TABLE SER.dbo.Documento (
	DocumentoID int IDENTITY(1,1) NOT NULL,
	TrabajoRecepcionalID int NULL,
	Notas varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TipoDocumentoID int NULL,
	CONSTRAINT PK_Documento PRIMARY KEY (DocumentoID),
	CONSTRAINT Documento_FK FOREIGN KEY (TipoDocumentoID) REFERENCES SER.dbo.TipoDocumento(IdTipo),
	CONSTRAINT FK_Documento_TrabajoRecepcional FOREIGN KEY (TrabajoRecepcionalID) REFERENCES SER.dbo.TrabajoRecepcional(TrabajoRecepcionalID)
);


-- SER.dbo.ExamenDefensa definition

-- Drop table

-- DROP TABLE SER.dbo.ExamenDefensa;

CREATE TABLE SER.dbo.ExamenDefensa (
	FechaAplicacion date NULL,
	ExamenDefensaID int IDENTITY(1,1) NOT NULL,
	TrabajoRecepcionalID int NOT NULL,
	CONSTRAINT PK_ExamenDefensa PRIMARY KEY (ExamenDefensaID),
	CONSTRAINT FK_ExamenDeDefensa_TrabajoRecepcional FOREIGN KEY (TrabajoRecepcionalID) REFERENCES SER.dbo.TrabajoRecepcional(TrabajoRecepcionalID)
);


-- SER.dbo.DocumentoExamenDefensa definition

-- Drop table

-- DROP TABLE SER.dbo.DocumentoExamenDefensa;

CREATE TABLE SER.dbo.DocumentoExamenDefensa (
	DocumentoID int NOT NULL,
	ExamenDefensaID int NOT NULL,
	CONSTRAINT PK_DocumentoExamenDefensa PRIMARY KEY (DocumentoID,ExamenDefensaID),
	CONSTRAINT FK_DocumentoExamenDefensa_Documento FOREIGN KEY (DocumentoID) REFERENCES SER.dbo.Documento(DocumentoID),
	CONSTRAINT FK_DocumentoExamenDefensa_ExamenDefensa FOREIGN KEY (ExamenDefensaID) REFERENCES SER.dbo.ExamenDefensa(ExamenDefensaID)
);


-- dbo.AlumnoTrabajoRecepcionalProyectoGuiadoView source

CREATE VIEW [dbo].[AlumnoTrabajoRecepcionalProyectoGuiadoView]
AS
SELECT dbo.Alumno.CorreoElectronico, dbo.Alumno.Matricula, dbo.Alumno.Nombre, dbo.TrabajoRecepcional.Estado, dbo.TrabajoRecepcional.Fechadeinicio, dbo.TrabajoRecepcional.Modalidad, 
                  dbo.ExperienciaEducativa.Nombre AS ExperienciaEducativa, dbo.ExperienciaEducativa.ExperienciaEducativaID, dbo.TrabajoRecepcional.TrabajoRecepcionalID
FROM     dbo.Alumno INNER JOIN
                  dbo.AlumnoTrabajoRecepcional ON dbo.Alumno.Matricula = dbo.AlumnoTrabajoRecepcional.AlumnoID INNER JOIN
                  dbo.TrabajoRecepcional ON dbo.AlumnoTrabajoRecepcional.TrabajoRecepcionalID = dbo.TrabajoRecepcional.TrabajoRecepcionalID INNER JOIN
                  dbo.AlumnoExperienciaEducativa ON dbo.Alumno.Matricula = dbo.AlumnoExperienciaEducativa.AlumnoID INNER JOIN
                  dbo.ExperienciaEducativa ON dbo.AlumnoExperienciaEducativa.ExperienciaEducativaID = dbo.ExperienciaEducativa.ExperienciaEducativaID
WHERE  (dbo.ExperienciaEducativa.Nombre = 'Proyecto Guiado');


-- dbo.Expediente source

-- dbo.Expediente source

CREATE VIEW dbo.Expediente AS SELECT dbo.Alumno.Nombre as NombreAlumno, dbo.Alumno.Matricula, dbo.Alumno.CorreoElectronico, dbo.TrabajoRecepcional.Nombre,
dbo.TrabajoRecepcional.TrabajoRecepcionalID, dbo.TrabajoRecepcional.Estado, dbo.TrabajoRecepcional.Fechadeinicio,
dbo.TrabajoRecepcional.Modalidad, dbo.TrabajoRecepcional.LineaDeInvestigacion from dbo.Alumno inner join 
dbo.AlumnoTrabajoRecepcional on dbo.AlumnoTrabajoRecepcional.AlumnoID  = Matricula 
inner JOIN dbo.TrabajoRecepcional on dbo.TrabajoRecepcional.TrabajoRecepcionalID  = AlumnoTrabajoRecepcional.TrabajoRecepcionalID;

