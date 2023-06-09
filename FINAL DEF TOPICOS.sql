USE [master]
GO
/****** Object:  Database [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ]    Script Date: 27/03/2023 11:59:56 a. m. ******/
CREATE DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET ARITHABORT OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET  MULTI_USER 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET QUERY_STORE = OFF
GO
USE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ]
GO
/****** Object:  UserDefinedFunction [dbo].[ObtenerNivelEducacionComun]    Script Date: 27/03/2023 11:59:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ObtenerNivelEducacionComun]()
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @NivelEducacion VARCHAR(50);
    
    SELECT TOP 1 WITH TIES @NivelEducacion = NivelAcademico
    FROM DimensionSociodemograficaLaboral
    GROUP BY NivelAcademico
    ORDER BY COUNT(*) DESC;
    
    RETURN @NivelEducacion;
END
GO
/****** Object:  Table [dbo].[dimension_psicologica]    Script Date: 27/03/2023 11:59:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimension_psicologica](
	[id] [int] NOT NULL,
	[conocimientos_puesto] [varchar](20) NOT NULL,
	[ideas_propias] [varchar](20) NOT NULL,
	[esfuerzo_mental] [varchar](20) NOT NULL,
	[tiempo_disponible] [varchar](20) NOT NULL,
	[exposicion_emociones_negativas] [varchar](20) NOT NULL,
	[apoyo_equipo_trabajo] [varchar](20) NOT NULL,
	[apoyo_superiores] [varchar](20) NOT NULL,
	[temor_perder_trabajo] [varchar](20) NOT NULL,
	[respeto_horarios_trabajo] [varchar](20) NOT NULL,
	[tiempo_sueño_necesario] [varchar](20) NOT NULL,
	[actividad_fisica] [varchar](20) NOT NULL,
	[tension_tiempo_casa_trabajo] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[calcularpromediodeladimensionpsicologica]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[calcularpromediodeladimensionpsicologica] (@tabla varchar(100))  
RETURNS TABLE  
AS  
RETURN   
    SELECT MAX(respuesta) AS maximo,  MIN(respuesta) AS minimo ,AVG(CAST(respuesta AS float)) AS promedio_psicologica
    FROM  (SELECT 
               CASE
                   WHEN conocimientos_puesto IS NOT NULL THEN conocimientos_puesto
                   WHEN ideas_propias IS NOT NULL THEN ideas_propias
                   WHEN esfuerzo_mental IS NOT NULL THEN esfuerzo_mental
				   WHEN tiempo_disponible IS NOT NULL THEN tiempo_disponible
				   WHEN exposicion_emociones_negativas IS NOT NULL THEN exposicion_emociones_negativas
				   WHEN apoyo_equipo_trabajo IS NOT NULL THEN apoyo_equipo_trabajo
				   WHEN apoyo_superiores IS NOT NULL THEN apoyo_superiores
				   WHEN temor_perder_trabajo IS NOT NULL THEN temor_perder_trabajo
				   WHEN respeto_horarios_trabajo IS NOT NULL THEN respeto_horarios_trabajo
				   WHEN tiempo_sueño_necesario IS NOT NULL THEN tiempo_sueño_necesario
				   WHEN actividad_fisica IS NOT NULL THEN actividad_fisica
				   WHEN tension_tiempo_casa_trabajo IS NOT NULL THEN tension_tiempo_casa_trabajo
                   -- agregar más columnas según sea necesario
                   ELSE NULL
               END AS respuesta
           FROM dimension_psicologica) AS subconsulta;
GO
/****** Object:  Table [dbo].[dimension_ergonomia]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimension_ergonomia](
	[id] [int] NOT NULL,
	[posicion_manipula] [int] NOT NULL,
	[trabajo_incomodo] [int] NOT NULL,
	[levanta_arrastra_peso] [int] NOT NULL,
	[movimientos_repetitivos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimension_higiene_industrial]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimension_higiene_industrial](
	[expuesto_al_ruido] [int] NULL,
	[nivel_ruido] [int] NULL,
	[expuesto_a_vibraciones] [int] NULL,
	[tipo_vibraciones] [int] NULL,
	[expuesto_a_radiaciones] [int] NULL,
	[tiempo_radiaciones] [int] NULL,
	[temperatura_trabajo] [int] NULL,
	[humedad_trabajo] [int] NULL,
	[manipula_sust_quimicas] [int] NULL,
	[sust_quimicas_etiqueta] [int] NULL,
	[inhala_polvos] [int] NULL,
	[manipula_sust_toxicas] [int] NULL,
	[tiempo_expuesto_sust_contaminados] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimension_salud]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimension_salud](
	[considera_salud] [int] NULL,
	[trabajo_afecta_salud] [int] NULL,
	[ha_tenido_accidente] [int] NULL,
	[problemas_emocionales] [int] NULL,
	[accidente_anterior] [int] NULL,
	[cantidad_accidentes] [int] NULL,
	[impide_llegar_trabajo] [int] NULL,
	[enfermedad_profesional] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimension_seguridad_salud_trabajo]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimension_seguridad_salud_trabajo](
	[id] [int] NOT NULL,
	[riesgo_caida_nivel_alto] [int] NULL,
	[riesgo_caida_distinto_nivel] [int] NULL,
	[riesgo_caida_objetos_materiales] [int] NULL,
	[riesgo_desplomes_derrumbes] [int] NULL,
	[riesgo_cortes] [int] NULL,
	[riesgo_golpes] [int] NULL,
	[riesgo_atropellos] [int] NULL,
	[riesgo_atrapamiento] [int] NULL,
	[riesgo_proyeccion_particulas] [int] NULL,
	[riesgo_quemaduras] [int] NULL,
	[danos_producidos_sol] [int] NULL,
	[riesgo_incendios] [int] NULL,
	[danos_animales] [int] NULL,
	[riesgo_contactos_electricos] [int] NULL,
	[riesgo_accidentes_transito] [int] NULL,
	[usa_equipo_proteccion] [int] NULL,
	[equipo_proteccion_obligado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimensionCondicionesEmpleo]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionCondicionesEmpleo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AnosTrabajando] [int] NULL,
	[HorasTrabajoSemana] [int] NULL,
	[TiempoCompleto] [int] NULL,
	[TipoTrabajo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimensionSociodemograficaLaboral]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionSociodemograficaLaboral](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sexo] [int] NULL,
	[Edad] [int] NULL,
	[Colombiano] [bit] NULL,
	[PaisNacimiento] [varchar](255) NULL,
	[NivelAcademico] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encuesta]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuesta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFinalizacion] [time](7) NULL,
	[UsuarioID] [int] NULL,
	[DimensionErgonomiaID] [int] NULL,
	[DimensionHigieneIndustrialID] [int] NULL,
	[DimensionPsicologicaID] [int] NULL,
	[DimensionSaludID] [int] NULL,
	[DimensionSeguridadSaludTrabajoID] [int] NULL,
	[DimensionCondicionesEmpleoID] [int] NULL,
	[DimensionSociodemograficaLaboralID] [int] NULL,
	[GraciasPorLaParticipacionID] [int] NULL,
	[IdentificacionZonalID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GraciasPorLaParticipacion]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GraciasPorLaParticipacion](
	[EncuestadorNombre] [varchar](50) NULL,
	[EncuestadorApellido] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[HoraFinalizacion] [time](7) NULL,
	[Observaciones] [varchar](255) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentificacionZonal]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentificacionZonal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Zona] [varchar](255) NULL,
	[RespuestaIdentificacion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[edad] [int] NULL,
	[genero] [varchar](10) NULL,
	[correo] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[direccion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (1, 2, 4, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (2, 4, 5, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (3, 5, 5, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (4, 2, 5, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (5, 4, 5, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (6, 2, 4, 4, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (7, 5, 4, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (8, 4, 5, 4, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (9, 2, 5, 4, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (10, 5, 4, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (11, 2, 5, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (12, 2, 4, 4, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (13, 5, 5, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (14, 2, 4, 5, 1)
INSERT [dbo].[dimension_ergonomia] ([id], [posicion_manipula], [trabajo_incomodo], [levanta_arrastra_peso], [movimientos_repetitivos]) VALUES (15, 4, 5, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[dimension_higiene_industrial] ON 

INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 2, 3, NULL, 1, 2, 1, 1, 2, 3, 3, 5, 2, 1)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (3, 2, 3, NULL, 1, 2, 1, 1, 2, 3, 3, 5, 2, 2)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (4, 1, 3, NULL, 1, 2, 1, 1, 2, 3, 3, 5, 2, 3)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 1, 3, NULL, 1, 2, 3, 1, 2, 3, 3, 5, 3, 4)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 2, 3, NULL, 1, 2, 3, 1, 2, 3, 5, 5, 3, 5)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 2, 3, NULL, 1, 2, 3, 3, 2, 3, 5, 5, 3, 6)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 3, 3, NULL, 1, 2, 3, 3, 2, 3, 5, 5, 2, 7)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 3, 3, NULL, 1, 2, 3, 3, 2, 3, 5, 5, 3, 8)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (3, 2, 3, NULL, 1, 2, 3, 3, 2, 3, 5, 5, 2, 9)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (4, 2, 3, NULL, 1, 2, 1, 3, 2, 3, 3, 5, 3, 10)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 2, 3, NULL, 1, 2, 1, 3, 2, 3, 3, 5, 3, 11)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (1, 2, 3, NULL, 1, 2, 3, 3, 2, 3, 3, 5, 3, 12)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (4, 2, 3, NULL, 1, 2, 3, 3, 2, 3, 3, 5, 3, 13)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (4, 2, 3, NULL, 1, 2, 3, 3, 2, 3, 3, 5, 2, 14)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (2, 2, 3, NULL, 1, 2, 3, 3, 2, 3, 3, 5, 2, 15)
INSERT [dbo].[dimension_higiene_industrial] ([expuesto_al_ruido], [nivel_ruido], [expuesto_a_vibraciones], [tipo_vibraciones], [expuesto_a_radiaciones], [tiempo_radiaciones], [temperatura_trabajo], [humedad_trabajo], [manipula_sust_quimicas], [sust_quimicas_etiqueta], [inhala_polvos], [manipula_sust_toxicas], [tiempo_expuesto_sust_contaminados], [id]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16)
SET IDENTITY_INSERT [dbo].[dimension_higiene_industrial] OFF
GO
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (1, N'1', N'2', N'1', N'1', N'2', N'2', N'1', N'1', N'3', N'3', N'3', N'3')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (2, N'2', N'2', N'2', N'2', N'2', N'1', N'2', N'2', N'2', N'3', N'3', N'3')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (3, N'1', N'2', N'2', N'3', N'3', N'1', N'1', N'2', N'3', N'3', N'1', N'1')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (4, N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'3', N'3', N'3', N'3', N'1')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (5, N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'1', N'1', N'1', N'3', N'1')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (6, N'1', N'3', N'3', N'3', N'2', N'1', N'2', N'1', N'3', N'1', N'2', N'3')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (7, N'3', N'3', N'3', N'1', N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (8, N'1', N'1', N'1', N'3', N'2', N'3', N'3', N'3', N'1', N'2', N'3', N'3')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (9, N'2', N'1', N'2', N'1', N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (10, N'1', N'3', N'1', N'1', N'1', N'2', N'2', N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (11, N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (12, N'1', N'1', N'1', N'1', N'2', N'2', N'2', N'1', N'2', N'1', N'2', N'2')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (13, N'3', N'1', N'1', N'2', N'2', N'2', N'2', N'1', N'2', N'2', N'2', N'2')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (14, N'2', N'1', N'1', N'1', N'1', N'1', N'2', N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[dimension_psicologica] ([id], [conocimientos_puesto], [ideas_propias], [esfuerzo_mental], [tiempo_disponible], [exposicion_emociones_negativas], [apoyo_equipo_trabajo], [apoyo_superiores], [temor_perder_trabajo], [respeto_horarios_trabajo], [tiempo_sueño_necesario], [actividad_fisica], [tension_tiempo_casa_trabajo]) VALUES (15, N'1', N'1', N'2', N'2', N'3', N'3', N'2', N'2', N'1', N'1', N'2', N'2')
GO
SET IDENTITY_INSERT [dbo].[dimension_salud] ON 

INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (7, 6, 2, 2, 0, 0, 3, 2, 1)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 4, 1, 1, 2, 1, 1, 2, 2)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 3, 2, 2, 0, 0, 1, 2, 3)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 5, 2, 2, 0, 0, 3, 2, 4)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (6, 4, 2, 2, 0, 0, 2, 2, 5)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 4, 1, 1, 2, 2, 1, 2, 6)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 3, 2, 2, 0, 0, 1, 2, 7)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (3, 6, 2, 2, 0, 0, 1, 2, 8)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 3, 2, 2, 0, 0, 1, 2, 9)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 4, 2, 2, 0, 0, 3, 2, 10)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 4, 1, 2, 0, 0, 1, 2, 11)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (3, 1, 2, 2, 0, 0, 1, 2, 12)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 3, 2, 2, 0, 0, 3, 2, 13)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (3, 4, 2, 2, 0, 0, 1, 2, 14)
INSERT [dbo].[dimension_salud] ([considera_salud], [trabajo_afecta_salud], [ha_tenido_accidente], [problemas_emocionales], [accidente_anterior], [cantidad_accidentes], [impide_llegar_trabajo], [enfermedad_profesional], [id]) VALUES (5, 4, 2, 2, 0, 0, 1, 2, 15)
SET IDENTITY_INSERT [dbo].[dimension_salud] OFF
GO
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (1, 97, 3, 1, 1, 1, 1, 97, 3, 97, 97, 3, 2, 97, 4, 4, 1, 2)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (2, 4, 97, 2, 2, 2, 97, 97, 4, 4, 3, 2, 4, 97, 1, 97, 1, 8)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (3, 1, 1, 1, 1, 1, 1, 1, 2, 2, 97, 97, 97, 3, 97, 97, 2, 97)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (4, 97, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 2)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (5, 1, 4, 4, 1, 97, 97, 97, 2, 6, 4, 97, 97, 97, 97, 97, 1, 5)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (6, 4, 4, 4, 4, 4, 4, 4, 4, 4, 97, 97, 3, 3, 3, 3, 1, 6)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (7, 2, 2, 2, 3, 97, 97, 97, 97, 97, 97, 4, 3, 97, 3, 97, 2, 97)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (8, 4, 4, 4, 4, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3, 1, 2)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (9, 97, 97, 4, 3, 3, 2, 3, 3, 3, 3, 3, 33, 3, 3, 3, 2, 97)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (10, 3, 3, 3, 3, 3, 3, 3, 3, 97, 4, 97, 97, 97, 2, 3, 2, 97)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (11, 4, 4, 4, 3, 3, 3, 3, 4, 2, 97, 97, 97, 97, 1, 2, 1, 8)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (12, 97, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 1, 6)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (13, 1, 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 2, 97)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (14, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 8)
INSERT [dbo].[dimension_seguridad_salud_trabajo] ([id], [riesgo_caida_nivel_alto], [riesgo_caida_distinto_nivel], [riesgo_caida_objetos_materiales], [riesgo_desplomes_derrumbes], [riesgo_cortes], [riesgo_golpes], [riesgo_atropellos], [riesgo_atrapamiento], [riesgo_proyeccion_particulas], [riesgo_quemaduras], [danos_producidos_sol], [riesgo_incendios], [danos_animales], [riesgo_contactos_electricos], [riesgo_accidentes_transito], [usa_equipo_proteccion], [equipo_proteccion_obligado]) VALUES (15, 3, 4, 3, 2, 2, 2, 1, 1, 1, 97, 97, 97, 97, 4, 4, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[DimensionCondicionesEmpleo] ON 

INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (1, 1, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (2, 6, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (3, 2, 4, 2, 3)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (4, 3, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (5, 2, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (6, 1, 8, 1, 2)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (7, 5, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (8, 2, 4, 2, 3)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (9, 5, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (10, 3, 4, 2, 3)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (11, 2, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (12, 1, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (13, 4, 8, 1, 1)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (14, 1, 4, 2, 3)
INSERT [dbo].[DimensionCondicionesEmpleo] ([ID], [AnosTrabajando], [HorasTrabajoSemana], [TiempoCompleto], [TipoTrabajo]) VALUES (15, 1, 8, 1, 1)
SET IDENTITY_INSERT [dbo].[DimensionCondicionesEmpleo] OFF
GO
SET IDENTITY_INSERT [dbo].[DimensionSociodemograficaLaboral] ON 

INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (1, 1, 37, 1, N'Colombia', 5)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (2, 2, 39, 1, N'Colombia ', 8)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (3, 1, 28, 1, N'Colombia', 6)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (4, 2, 63, 1, N'Colombia', 4)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (5, 2, 28, 0, N'Venezuela', 3)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (6, 1, 54, 1, N'Colombia', 8)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (7, 1, 48, 1, N'Colombia', 5)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (8, 2, 39, 1, N'Colombia', 6)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (9, 1, 52, 1, N'Colombia', 7)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (10, 2, 31, 1, N'Colombia', 6)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (11, 1, 61, 1, N'Colombia ', 2)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (12, 1, 45, 0, N'Venezuela ', 9)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (13, 1, 36, 1, N'Colombia ', 6)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (14, 1, 68, 1, N'Chile', 6)
INSERT [dbo].[DimensionSociodemograficaLaboral] ([ID], [Sexo], [Edad], [Colombiano], [PaisNacimiento], [NivelAcademico]) VALUES (15, 2, 51, 1, N'Colombia ', 7)
SET IDENTITY_INSERT [dbo].[DimensionSociodemograficaLaboral] OFF
GO
SET IDENTITY_INSERT [dbo].[Encuesta] ON 

INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (1, CAST(N'2023-03-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (2, CAST(N'2023-03-02' AS Date), CAST(N'10:10:00' AS Time), CAST(N'12:00:00' AS Time), 2, 2, 2, 2, 2, 2, 2, 2, 2, 2)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (3, CAST(N'2023-03-02' AS Date), CAST(N'12:15:00' AS Time), CAST(N'14:00:00' AS Time), 3, 3, 3, 3, 3, 3, 3, 3, 3, 3)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (4, CAST(N'2023-03-02' AS Date), CAST(N'14:09:00' AS Time), CAST(N'15:00:00' AS Time), 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (5, CAST(N'2023-03-02' AS Date), CAST(N'15:10:00' AS Time), CAST(N'16:00:00' AS Time), 5, 5, 5, 5, 5, 5, 5, 5, 5, 5)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (6, CAST(N'2023-03-04' AS Date), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 6, 6, 6, 6, 6, 6, 6, 6, 6, 6)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (7, CAST(N'2023-03-04' AS Date), CAST(N'08:30:00' AS Time), CAST(N'10:00:00' AS Time), 7, 7, 7, 7, 7, 7, 7, 7, 7, 7)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (8, CAST(N'2023-03-04' AS Date), CAST(N'10:10:00' AS Time), CAST(N'12:00:00' AS Time), 8, 8, 8, 8, 8, 8, 8, 8, 8, 8)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (9, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), CAST(N'14:30:00' AS Time), 9, 9, 9, 9, 9, 9, 9, 9, 9, 9)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (10, CAST(N'2023-03-04' AS Date), CAST(N'14:45:00' AS Time), CAST(N'16:00:00' AS Time), 10, 10, 10, 10, 10, 10, 10, 10, 10, 10)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (11, CAST(N'2023-03-06' AS Date), CAST(N'08:30:00' AS Time), CAST(N'09:15:00' AS Time), 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (12, CAST(N'2023-03-06' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 12, 12, 12, 12, 12, 12, 12, 12, 12, 12)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (13, CAST(N'2023-03-06' AS Date), CAST(N'15:10:00' AS Time), CAST(N'16:00:00' AS Time), 13, 13, 13, 13, 13, 13, 13, 13, 13, 13)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (14, CAST(N'2023-03-08' AS Date), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 14, 14, 14, 14, 14, 14, 14, 14, 14, 14)
INSERT [dbo].[Encuesta] ([ID], [Fecha], [HoraInicio], [HoraFinalizacion], [UsuarioID], [DimensionErgonomiaID], [DimensionHigieneIndustrialID], [DimensionPsicologicaID], [DimensionSaludID], [DimensionSeguridadSaludTrabajoID], [DimensionCondicionesEmpleoID], [DimensionSociodemograficaLaboralID], [GraciasPorLaParticipacionID], [IdentificacionZonalID]) VALUES (15, CAST(N'2023-03-08' AS Date), CAST(N'09:12:00' AS Time), CAST(N'10:00:00' AS Time), 15, 15, 15, 15, 15, 15, 15, 15, 15, 15)
SET IDENTITY_INSERT [dbo].[Encuesta] OFF
GO
SET IDENTITY_INSERT [dbo].[GraciasPorLaParticipacion] ON 

INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-02' AS Date), CAST(N'10:00:00' AS Time), N'N/A', 1)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), N'El trabajador estaba asustado', 2)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), N'N/A', 3)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), N'La entrevista terminó antes porque el trabajador debía volver a su trabajo', 4)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), N'N/A', 5)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-04' AS Date), CAST(N'08:00:00' AS Time), N'N/A', 6)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-04' AS Date), CAST(N'10:00:00' AS Time), N'N/A', 7)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), N'N/A', 8)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-04' AS Date), CAST(N'14:30:00' AS Time), N'N/A', 9)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), N'N/A', 10)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-06' AS Date), CAST(N'09:15:00' AS Time), N'Se llega a la entrevista temprano pero el empleado tuvo incoveniente con la llegada ', 11)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), N'N/A', 12)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), N'N/A', 13)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-08' AS Date), CAST(N'08:00:00' AS Time), N'N/A', 14)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (N'Sara', N'Restrepo Granda', CAST(N'2023-03-08' AS Date), CAST(N'12:00:00' AS Time), N'N/A', 15)
INSERT [dbo].[GraciasPorLaParticipacion] ([EncuestadorNombre], [EncuestadorApellido], [Fecha], [HoraFinalizacion], [Observaciones], [id]) VALUES (NULL, NULL, NULL, NULL, NULL, 17)
SET IDENTITY_INSERT [dbo].[GraciasPorLaParticipacion] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentificacionZonal] ON 

INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (1, N'F2', N'Parroquia la esperanza ')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (2, N'F4', N'Sur')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (3, N'F3', N'Barrio Altavista')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (4, N'F3', N'Barrio Rosalpi')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (5, N'F3', N'Barrio Cumbre')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (6, N'F4', N'Norte')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (7, N'F4', N'Centro')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (8, N'F3', N'Barrio Rosales')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (9, N'F3', N'Barrio Villa Maria')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (10, N'F3', N'Barrio la loma')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (11, N'F4', N'Centro')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (12, N'F3', N'Barrio Santa Rosa')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (13, N'F3', N'Barrio Hato Nuevo')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (14, N'F3', N'Barrio Bellavista ')
INSERT [dbo].[IdentificacionZonal] ([ID], [Zona], [RespuestaIdentificacion]) VALUES (15, N'F3', N'Barrio Trapiche ')
SET IDENTITY_INSERT [dbo].[IdentificacionZonal] OFF
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (1, N'Daniel ', N'Carvajal', 37, N'M', N'danielcarvajal@gmail.com', N'3043717811', N'carrera 57 A # 53-54')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (2, N'Esmeralda ', N'Granda ', 39, N'F', N'esmeraldagranda@gmail.com', N'3108271966', N'calle 25  35-43')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (3, N'Eddy ', N'Berrio', 28, N'M', N'eddy78@gmail.com', N'3098646932', N'carrera 53-63')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (4, N'Liliana ', N'Ospina ', 63, N'F', N'Liliana_ops@gmail.com', N'3985626632', N'Calle 53 A 17-56')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (5, N'Celeste ', N'Montoya', 28, N'F', N'Celestecaravajal@gmail.com', N'3105896435', N'Av 15-5698')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (6, N'Víctor Manue ', N'Ramos Carrión', 54, N'M', N'vimanur@hotmail.com', N'3045962966', N'Calle 88-98-98')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (7, N'Sergio Alejandro', N'Franco', 48, N'M', N'comisiondevocaciones@lasalle.org.ar', N'3105896478', N'Altavista-buenos aires ')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (8, N' Valentina', N'Morande', 39, N'F', N'valentinamorande@hotmail.com', N'3018596785', N'Diagonal 58-98')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (9, N'Cesar Andrés', N'Carvajal C.', 52, N'M', N'caccfsc@yahoo.com', N'3059684565', N'Calle 8-52')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (10, N'Maria José', N'Gonzales', 31, N'F', N'mjdelaroca@lasalleca.org', N'3005986897', N'Av 72-92-8')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (11, N'Gerardo ', N'Quinteros', 61, N'M', N'salleor@hotmail.com', N'3028948562', N'Vereda la loma')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (12, N' David', N'Garcia', 45, N'M', N'davidfsc@gmail.com', N'3108957458', N'Calle 87-89-6')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (13, N'Sebastián', N'Torres', 36, N'M', N'scornejot@hotmail.com', N'3894290835', N'Carrera 57 B# 56-89')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (14, N' Dan ', N'Cruz', 68, N'M', N'hnopastoralca@lasalleca.org', N'3045698856', N'Calle 85 C 2')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [genero], [correo], [telefono], [direccion]) VALUES (15, N'Alexa', N'Zapata', 51, N'F', N'alexa.zapata@delasalle.edu.co', N'3004265893', N'Diagonal 8#5-8')
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_dimension_ergonomia] FOREIGN KEY([DimensionErgonomiaID])
REFERENCES [dbo].[dimension_ergonomia] ([id])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_dimension_ergonomia]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_dimension_higiene_industrial] FOREIGN KEY([DimensionHigieneIndustrialID])
REFERENCES [dbo].[dimension_higiene_industrial] ([id])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_dimension_higiene_industrial]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_dimension_psicologica] FOREIGN KEY([DimensionPsicologicaID])
REFERENCES [dbo].[dimension_psicologica] ([id])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_dimension_psicologica]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_dimension_salud] FOREIGN KEY([DimensionSaludID])
REFERENCES [dbo].[dimension_salud] ([id])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_dimension_salud]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_dimension_seguridad_salud_trabajo] FOREIGN KEY([DimensionSeguridadSaludTrabajoID])
REFERENCES [dbo].[dimension_seguridad_salud_trabajo] ([id])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_dimension_seguridad_salud_trabajo]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_DimensionCondicionesEmpleo] FOREIGN KEY([DimensionCondicionesEmpleoID])
REFERENCES [dbo].[DimensionCondicionesEmpleo] ([ID])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_DimensionCondicionesEmpleo]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_DimensionSociodemograficaLaboral] FOREIGN KEY([DimensionSociodemograficaLaboralID])
REFERENCES [dbo].[DimensionSociodemograficaLaboral] ([ID])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_DimensionSociodemograficaLaboral]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_GraciasPorLaParticipacion] FOREIGN KEY([GraciasPorLaParticipacionID])
REFERENCES [dbo].[GraciasPorLaParticipacion] ([id])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_GraciasPorLaParticipacion]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_IdentificacionZonal] FOREIGN KEY([IdentificacionZonalID])
REFERENCES [dbo].[IdentificacionZonal] ([ID])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_IdentificacionZonal]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEncuesta]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEncuesta]
(
    @ID INT,
    @Fecha DATE,
    @DimensionErgonomiaID INT,
    @DimensionHigieneIndustrialID INT,
    @DimensionPsicologicaID INT,
    @DimensionSaludID INT,
    @DimensionSeguridadSaludTrabajoID INT,
	@DimensionCondicionesEmpleoID INT,
	@DimensionSociodemograficaLaboralID INT,
	@GraciasPorLaParticipacionID INT,
	@IdentificacionZonalID INT
)
AS
BEGIN
    -- Validaciones de dominio de valores
    IF @Fecha > GETDATE()
    BEGIN
        RAISERROR ('La fecha no puede ser posterior a la fecha actual.', 16, 1)
        RETURN
    END

    IF @DimensionErgonomiaID < 1 OR @DimensionErgonomiaID > 15
    BEGIN
        RAISERROR ('La dimensión de Ergonomía debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

        IF @DimensionHigieneIndustrialID < 1 OR @DimensionHigieneIndustrialID > 15
    BEGIN
        RAISERROR ('La dimensión de Higiene industrial debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

       IF @DimensionPsicologicaID  < 1 OR @DimensionPsicologicaID  > 15
    BEGIN
        RAISERROR ('La dimensión de psicología debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

       IF @DimensionSaludID < 1 OR @DimensionSaludID > 15
    BEGIN
        RAISERROR ('La dimensión de salud  debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

        IF @DimensionSeguridadSaludTrabajoID < 1 OR @DimensionSeguridadSaludTrabajoID > 15
    BEGIN
        RAISERROR ('La dimensión de seguridad y salud en el trabajo debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

	    IF @DimensionCondicionesEmpleoID  < 1 OR @DimensionCondicionesEmpleoID  > 15
    BEGIN
        RAISERROR ('La dimensión de condiciones de empleo debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

	    IF @DimensionSociodemograficaLaboralID< 1 OR @DimensionSociodemograficaLaboralID > 15
    BEGIN
        RAISERROR ('La dimensión sociodemografica y laboral debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

	    IF @GraciasPorLaParticipacionID< 1 OR @GraciasPorLaParticipacionID > 15
    BEGIN
        RAISERROR ('La dimension gracias por la pasrticipación debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

	    IF @IdentificacionZonalID < 1 OR @IdentificacionZonalID > 15
    BEGIN
        RAISERROR ('La dimensión identificación Zonal debe tener un valor entre 1 y 15.', 16, 1)
        RETURN
    END

    -- Actualización de la encuesta
    UPDATE Encuesta
    SET @Fecha = @Fecha,
        @DimensionErgonomiaID  = @DimensionErgonomiaID ,
        @DimensionHigieneIndustrialID  = @DimensionHigieneIndustrialID ,
        @DimensionPsicologicaID = @DimensionPsicologicaID,
        @DimensionSaludID = @DimensionSaludID,
        @DimensionSeguridadSaludTrabajoID = @DimensionSeguridadSaludTrabajoID,
		@DimensionCondicionesEmpleoID  = @DimensionCondicionesEmpleoID,
		@DimensionSociodemograficaLaboralID = @DimensionSociodemograficaLaboralID,
        @GraciasPorLaParticipacionID = @GraciasPorLaParticipacionID,
		@IdentificacionZonalID = @IdentificacionZonalID
    WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_encuesta]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[eliminar_encuesta] (@consecutivo INT)

AS
BEGIN
    DECLARE @mensaje VARCHAR(100)
    
    -- Validar que el consecutivo sea válido
    IF NOT EXISTS (SELECT * FROM Encuesta WHERE ID = @consecutivo)
    BEGIN
        SET @mensaje = 'El consecutivo de encuesta no existe'
    END
    ELSE
    BEGIN
        -- Eliminar la encuesta
        DELETE FROM Encuesta WHERE ID = @consecutivo
        
        SET @mensaje = 'Encuesta eliminada exitosamente'
    END
    
    RETURN @mensaje
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEncuestasPorrangos]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEncuestasPorrangos]
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT *
    FROM Encuesta
    WHERE Fecha BETWEEN @FechaInicio AND @FechaFin
END

--Consulta para los rangos, se coloca los rangos que queremos buscar 
EXEC ObtenerEncuestasPorrangos'2023-03-02', '2023-03-04'
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMolestiasMasFrecuente]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMolestiasMasFrecuente]
AS
BEGIN
    SELECT TOP 1 DimensionHigieneIndustrialID, COUNT(*) as Frecuencia
    FROM Encuesta
    GROUP BY DimensionHigieneIndustrialID
    ORDER BY Frecuencia DESC
END
GO
/****** Object:  StoredProcedure [dbo].[validarcamposEncuesta]    Script Date: 27/03/2023 11:59:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[validarcamposEncuesta]
   @Fecha DATE,
   @DimensionErgonomiaID INT,
   @DimensionHigieneIndustrialID INT,
   @DimensionPsicologicaID INT,
   @DimensionSaludID INT,
   @DimensionSeguridadSaludTrabajoID INT,
   @DimensionCondicionesEmpleoID INT,
   @DimensionSociodemograficaLaboralID INT,
   @GraciasPorLaParticipacionID INT,
   @IdentificacionZonalID INT
AS
BEGIN

   -- Validación de la fecha de ingreso
   IF @Fecha > GETDATE()
   BEGIN
      RAISERROR('La fecha de ingreso no puede ser mayor a la fecha actual.', 16, 1)
      RETURN
   END
   
   -- Validación Dimensión Ergonomia  
   IF @DimensionErgonomiaID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimensión Ergonomia no puede negativo.', 16, 1)
      RETURN
   END
   
  -- Validación	Dimension Higiene Industrial
   IF @DimensionHigieneIndustrialID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimensión Higiene industrial no puede negativo.', 16, 1)
      RETURN
   END
   
  -- Validación	Dimension psicologica 
   IF @DimensionPsicologicaID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimension psicologica no puede negativo.', 16, 1)
      RETURN
   END
   
    -- Validación	Dimension salud 
   IF @DimensionSaludID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimensión salud no puede negativo.', 16, 1)
      RETURN
   END

    -- Validación	Dimension Seguridad y salud en el trabajo 
   IF @DimensionSeguridadSaludTrabajoID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimensión Seguridad y salud en el trabajo no puede negativo.', 16, 1)
      RETURN
   END

    -- Validación	Dimension condiciones de empleo 
   IF @DimensionCondicionesEmpleoID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimension condiciones de empleo no puede negativo.', 16, 1)
      RETURN
   END

    -- Validación	Dimension Sociodemografica 
   IF @DimensionSociodemograficaLaboralID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimensión Socio demografica no puede negativo.', 16, 1)
      RETURN
   END

    -- Validación	Dimension Gracias por la participación 
   IF @GraciasPorLaParticipacionID<0
   BEGIN
      RAISERROR('EL valor registrado en Gracias por la participación no puede negativo.', 16, 1)
      RETURN
   END

    -- Validación	Dimension identificacion zonal 
   IF @IdentificacionZonalID<0
   BEGIN
      RAISERROR('EL valor registrado en la Dimensión de identificacion zonal no puede negativo.', 16, 1)
      RETURN
   END
   -- Si todas las validaciones pasan, el procedimiento no retorna ningún error
   PRINT 'Los datos del empleado son válidos.'
END

GO
USE [master]
GO
ALTER DATABASE [ENCUESTA SEGURIDAD Y SALUD EN EL TRABAJO ] SET  READ_WRITE 
GO
