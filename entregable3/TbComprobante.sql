USE [bd_NegocioAutosA1]
GO

DROP TABLE [dbo].[tb_Comprobante];

CREATE TABLE [dbo].[tb_Comprobante](
	[codComprobante] [smallint] NOT NULL,
	[docIdentidad] [varchar](15) NOT NULL,
	[codServicio] [smallint] NOT NULL,
	[fechaEmision] [datetime] NOT NULL,
	[Est_Comprobante] [int] NOT NULL,
	[Fec_Registro] [datetime] NULL,
	[Usu_Registro] [varchar](20) NULL,
	[Fec_Ult_Mod] [datetime] NULL,
	[Usu_Ult_Mod] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[codComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Comprobante]  WITH CHECK ADD FOREIGN KEY([codServicio])
REFERENCES [dbo].[tb_Servicios] ([codServicio])
GO

ALTER TABLE [dbo].[tb_Comprobante]  WITH CHECK ADD FOREIGN KEY([docIdentidad])
REFERENCES [dbo].[tb_Cliente] ([docIdentidad])
GO

ALTER TABLE [dbo].[tb_Comprobante]  WITH CHECK ADD  CONSTRAINT [chk_Est_Comprobante] CHECK  (([Est_Comprobante]=(3) OR [Est_Comprobante]=(2) OR [Est_Comprobante]=(1)))
GO

ALTER TABLE [dbo].[tb_Comprobante] CHECK CONSTRAINT [chk_Est_Comprobante]
GO