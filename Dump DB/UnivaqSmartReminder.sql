USE [master]
GO
/****** Object:  Database [UnivaqSmartReminder]    Script Date: 11/02/2017 23:00:33 ******/
CREATE DATABASE [UnivaqSmartReminder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UnivaqSmartReminder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UnivaqSmartReminder.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UnivaqSmartReminder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UnivaqSmartReminder_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UnivaqSmartReminder] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UnivaqSmartReminder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UnivaqSmartReminder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET ARITHABORT OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UnivaqSmartReminder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UnivaqSmartReminder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UnivaqSmartReminder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UnivaqSmartReminder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET RECOVERY FULL 
GO
ALTER DATABASE [UnivaqSmartReminder] SET  MULTI_USER 
GO
ALTER DATABASE [UnivaqSmartReminder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UnivaqSmartReminder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UnivaqSmartReminder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UnivaqSmartReminder] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UnivaqSmartReminder] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UnivaqSmartReminder]
GO
/****** Object:  Table [dbo].[Aule]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Aula] [varchar](5) NULL,
	[Edificio] [int] NULL,
	[Capienza] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Aule_Libere]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aule_Libere](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Aula] [int] NULL,
	[Giorno_Sett] [smallint] NULL,
	[Dalle] [time](7) NULL,
	[Alle] [time](7) NULL,
 CONSTRAINT [PK__Aule_Lib__3214EC072CFFFF53] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Avvisi]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Avvisi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Data_pubblicazione] [date] NULL,
	[Testo] [varchar](max) NULL,
	[Dipartimento] [int] NOT NULL,
	[Link] [varchar](max) NULL,
	[Expiry_Date] [date] NULL,
 CONSTRAINT [PK__Avvisi__3214EC07FC629914] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Corsi]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Corsi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Corso] [varchar](8) NULL,
	[Nome] [varchar](30) NULL,
	[Docenti] [int] NULL,
	[Lingua] [varchar](2) NULL,
	[Semestre] [varchar](10) NULL,
	[CFU] [smallint] NULL,
	[SSD] [varchar](6) NULL,
	[CdL] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Corsi_Laurea]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Corsi_Laurea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dipartimento] [int] NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Nome] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dipartimenti]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dipartimenti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sigla] [varchar](5010) NULL,
	[Nome_Esteso] [varchar](90) NULL,
 CONSTRAINT [PK_Dipartimenti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Docenti]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Docenti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[Cognome] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Dipartimento] [int] NULL,
	[Link] [varchar](100) NULL,
 CONSTRAINT [PK__Docenti__3214EC07F623F33A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Edifici]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Edifici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Indirizzo] [varchar](80) NULL,
	[Citta] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Giorni_Settimana]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Giorni_Settimana](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](10) NULL,
 CONSTRAINT [PK_Giorni_Settimana] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orari]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orari](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Giorno] [varchar](9) NOT NULL,
	[Inizio] [time](7) NOT NULL,
	[Fine] [time](7) NOT NULL,
	[Aula] [int] NOT NULL,
	[Corso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scadenze_Eventi]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scadenze_Eventi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Data] [date] NULL,
	[Titolo] [varchar](100) NULL,
	[Descrizione] [varchar](max) NULL,
	[Sede] [varchar](100) NULL,
	[Link] [varchar](max) NULL,
	[Expiry_Date] [date] NULL,
 CONSTRAINT [PK__Scadenze__3214EC07B245CBF9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Utenti]    Script Date: 11/02/2017 23:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utenti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](20) NULL,
	[Cognome] [varchar](20) NULL,
	[Matricola] [bigint] NULL,
	[Email] [varchar](30) NULL,
	[Password] [varchar](15) NULL,
	[CdL] [int] NULL,
	[RFID_Identifier] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_Utenti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Aule]  WITH CHECK ADD  CONSTRAINT [FK_Aule_Edifici] FOREIGN KEY([Edificio])
REFERENCES [dbo].[Edifici] ([Id])
GO
ALTER TABLE [dbo].[Aule] CHECK CONSTRAINT [FK_Aule_Edifici]
GO
ALTER TABLE [dbo].[Aule_Libere]  WITH CHECK ADD  CONSTRAINT [FK_Aule_Libere_Aule] FOREIGN KEY([Aula])
REFERENCES [dbo].[Aule] ([Id])
GO
ALTER TABLE [dbo].[Aule_Libere] CHECK CONSTRAINT [FK_Aule_Libere_Aule]
GO
ALTER TABLE [dbo].[Aule_Libere]  WITH CHECK ADD  CONSTRAINT [FK_Aule_Libere_Giorni_Settimana] FOREIGN KEY([Giorno_Sett])
REFERENCES [dbo].[Giorni_Settimana] ([Id])
GO
ALTER TABLE [dbo].[Aule_Libere] CHECK CONSTRAINT [FK_Aule_Libere_Giorni_Settimana]
GO
ALTER TABLE [dbo].[Avvisi]  WITH CHECK ADD  CONSTRAINT [FK_Avvisi_Corsi_Laurea] FOREIGN KEY([Dipartimento])
REFERENCES [dbo].[Corsi_Laurea] ([Id])
GO
ALTER TABLE [dbo].[Avvisi] CHECK CONSTRAINT [FK_Avvisi_Corsi_Laurea]
GO
ALTER TABLE [dbo].[Corsi]  WITH CHECK ADD  CONSTRAINT [FK_Corsi_Corsi_Laurea] FOREIGN KEY([CdL])
REFERENCES [dbo].[Corsi_Laurea] ([Id])
GO
ALTER TABLE [dbo].[Corsi] CHECK CONSTRAINT [FK_Corsi_Corsi_Laurea]
GO
ALTER TABLE [dbo].[Corsi]  WITH CHECK ADD  CONSTRAINT [FK_Corsi_Docenti] FOREIGN KEY([Docenti])
REFERENCES [dbo].[Docenti] ([Id])
GO
ALTER TABLE [dbo].[Corsi] CHECK CONSTRAINT [FK_Corsi_Docenti]
GO
ALTER TABLE [dbo].[Corsi_Laurea]  WITH CHECK ADD  CONSTRAINT [FK_Corsi_Laurea_Dipartimenti] FOREIGN KEY([Dipartimento])
REFERENCES [dbo].[Dipartimenti] ([Id])
GO
ALTER TABLE [dbo].[Corsi_Laurea] CHECK CONSTRAINT [FK_Corsi_Laurea_Dipartimenti]
GO
ALTER TABLE [dbo].[Docenti]  WITH CHECK ADD  CONSTRAINT [FK_Docenti_Dipartimenti] FOREIGN KEY([Dipartimento])
REFERENCES [dbo].[Dipartimenti] ([Id])
GO
ALTER TABLE [dbo].[Docenti] CHECK CONSTRAINT [FK_Docenti_Dipartimenti]
GO
ALTER TABLE [dbo].[Orari]  WITH CHECK ADD  CONSTRAINT [FK_Orari_Aule] FOREIGN KEY([Aula])
REFERENCES [dbo].[Aule] ([Id])
GO
ALTER TABLE [dbo].[Orari] CHECK CONSTRAINT [FK_Orari_Aule]
GO
ALTER TABLE [dbo].[Orari]  WITH CHECK ADD  CONSTRAINT [FK_Orari_Corsi] FOREIGN KEY([Corso])
REFERENCES [dbo].[Corsi] ([Id])
GO
ALTER TABLE [dbo].[Orari] CHECK CONSTRAINT [FK_Orari_Corsi]
GO
ALTER TABLE [dbo].[Utenti]  WITH CHECK ADD  CONSTRAINT [FK_Utenti_Corsi_Laurea] FOREIGN KEY([CdL])
REFERENCES [dbo].[Corsi_Laurea] ([Id])
GO
ALTER TABLE [dbo].[Utenti] CHECK CONSTRAINT [FK_Utenti_Corsi_Laurea]
GO
USE [master]
GO
ALTER DATABASE [UnivaqSmartReminder] SET  READ_WRITE 
GO
