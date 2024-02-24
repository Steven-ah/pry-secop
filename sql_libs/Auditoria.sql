USE [SECOP]
GO

/****** Object:  Table [dbo].[Auditoria]    Script Date: 24/02/2024 11:06:01 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Auditoria](
	[Id] [uniqueidentifier] NOT NULL,
	[TableName] [nvarchar](255) NOT NULL,
	[ActionType] [nvarchar](50) NOT NULL,
	[OldValues] [xml],
	[NewValues] [xml],
	[ObjectId] [uniqueidentifier] NOT NULL,
	[ChangeDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Auditoria] ADD  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [dbo].[Auditoria] ADD  DEFAULT (getdate()) FOR [ChangeDate]
GO

CREATE CLUSTERED INDEX [IX_AuditoriaTabla_ChangeDate] ON [dbo].[Auditoria]
(
	[ChangeDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO