USE [SECOP]
GO

/****** Object:  Table [dbo].[Entidad]    Script Date: 24/02/2024 10:56:29 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Entidad](
	[IdEntidad] [uniqueidentifier] NOT NULL,
	[NIT] [nvarchar](10) NULL,
	[Nombre] [nvarchar](150) NULL,
	[Departamento] [nvarchar](40) NULL,
	[Ciudad] [nvarchar](40) NULL,
	[Orden] [nvarchar](20) NULL,
	[Centralizada] [bit] NULL,
	[createdon] [datetime] NOT NULL,
	[modifiedon] [datetime] NOT NULL,
 CONSTRAINT [PK_Entidad] PRIMARY KEY CLUSTERED 
(
	[IdEntidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Entidad] ADD  CONSTRAINT [DF_Entidad_createdon]  DEFAULT (getdate()) FOR [createdon]
GO

ALTER TABLE [dbo].[Entidad] ADD  CONSTRAINT [DF_Entidad_modifiedon]  DEFAULT (getdate()) FOR [modifiedon]
GO

