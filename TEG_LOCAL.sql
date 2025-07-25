CREATE DATABASE TEG_LOCAL
GO
USE TEG_LOCAL
GO

CREATE TABLE [dbo].[CARDS](
	[card_id] [int] IDENTITY(1,1) NOT NULL,
	[card_type_id] [int] NULL,
	[card_detail] [varchar](255) NULL,
	[drawing] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARDS_TYPES]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARDS_TYPES](
	[card_type_id] [int] IDENTITY(1,1) NOT NULL,
	[card_type_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[card_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLORS]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLORS](
	[color_id] [int] IDENTITY(1,1) NOT NULL,
	[color_name] [nvarchar](20) NULL,
	[hex_code] [nvarchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTINENT]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTINENT](
	[continent_id] [int] IDENTITY(1,1) NOT NULL,
	[continent_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[continent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](50) NOT NULL,
	[controlling_player_id] [int] NULL,
	[base_armies] [int] NULL,
	[continent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COUNTRY_BORDER]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY_BORDER](
	[country_id] [int] NOT NULL,
	[neighbor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC,
	[neighbor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COUNTRY_CARDS]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY_CARDS](
	[country_card_id] [int] IDENTITY(1,1) NOT NULL,
	[card_id] [int] NULL,
	[game_id] [int] NULL,
	[picked] [bit] NULL,
	[country_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[country_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEAL]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEAL](
	[deal_id] [int] IDENTITY(1,1) NOT NULL,
	[deal_name] [nvarchar](100) NULL,
	[deal_type_id] [int] NULL,
	[game_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[deal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEAL_PLAYERS]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEAL_PLAYERS](
	[deal_player_id] [int] IDENTITY(1,1) NOT NULL,
	[deal_id] [int] NULL,
	[game_player_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[deal_player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GAME_PLAYERS]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAME_PLAYERS](
	[games_players_id] [int] IDENTITY(1,1) NOT NULL,
	[player_id] [int] NULL,
	[game_id] [int] NULL,
	[turn_order] [int] NULL,
	[player_army] [int] NULL,
	[wait_turns] [int] NULL,
	[color_id] [int] NULL,
	[difficulty_level] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[games_players_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GAMES]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAMES](
	[game_id] [int] IDENTITY(1,1) NOT NULL,
	[game_date] [datetime] NULL,
	[game_difficulty] [int] NULL,
	[game_state] [varchar](20) NULL,
	[current_turn_player_id] [int] NULL,
	[created_by_player_id] [int] NULL,
	[turn_state] [varchar](20) NULL,
	[phases_turn] [varchar](50) NULL,
	[round_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OBJETIVE_CARDS]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OBJETIVE_CARDS](
	[objetive_card_id] [int] IDENTITY(1,1) NOT NULL,
	[card_id] [int] NULL,
	[game_id] [int] NULL,
	[picked] [bit] NULL,
	[game_player_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objetive_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLAYER_TYPES]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAYER_TYPES](
	[player_type_id] [int] IDENTITY(1,1) NOT NULL,
	[player_type_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[player_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLAYERS]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAYERS](
	[player_id] [int] IDENTITY(1,1) NOT NULL,
	[player_user] [nvarchar](50) NULL,
	[pass_hash] [nvarchar](255) NULL,
	[avatar] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[last_login] [datetime] NULL,
	[player_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPE_DEAL]    Script Date: 2/7/2025 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPE_DEAL](
	[deal_type_id] [int] IDENTITY(1,1) NOT NULL,
	[deal_type_detail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[deal_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CARDS] ON 

INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (1, 1002, N'OCUPAR AFRICA, 5 PAISES DE AMÉRICA DEL NORTE y 4 PAISES DE EUROPA.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (2, 1002, N'OCUPAR AMERICA DEL SUR, 7 PAISES DE EUROPA y 3 PAISES LIMITROFES ENTRE SI EN CUALQUIER LUGAR DEL MAPA.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (3, 1002, N'OCUPAR ASIA y 2 PAISES DE AMERICA DEL SUR.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (4, 1002, N'OCUPAR EUROPA, 4 PAÍSES DE ASIA y 2 PAISES DE AMERICA DEL SUR.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (5, 1002, N'OCUPAR AMERICA DEL NORTE, 2 PAISES DE OCEANIA y 4 DE ASIA.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (6, 1002, N'OCUPAR 2 PAISES DE OCEANIA, 2 PAISES DE AFRICA, 2 PAISES DE AMERICA DEL SUR, 3 PAISES DE EUROPA, 4 DE AMERICA DEL NORTE y 3 DE ASIA.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (7, 1002, N'OCUPAR OCEANIA, AMERICA DEL NORTE y 2 PAISES DE EUROPA.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (8, 1002, N'OCUPAR AMERICA DEL SUR, AFRICA y 4 PAISES DE ASIA.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (9, 1002, N'OCUPAR OCEANIA, AFRICA y 5 PAISES DE AMERICA DEL NORTE.', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (10, 1003, N'DESTRUIR AL EJERCITO AMARILLO', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (11, 1003, N'DESTRUIR AL EJERCITO AZUL', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (12, 1003, N'DESTRUIR AL EJERCITO NEGRO', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (13, 1003, N'DESTRUIR AL EJERCITO ROJO', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (14, 1003, N'DESTRUIR AL EJERCITO VERDE', NULL)
INSERT [dbo].[CARDS] ([card_id], [card_type_id], [card_detail], [drawing]) VALUES (15, 1003, N'DESTRUIR AL EJERCITO BLANCO', NULL)
SET IDENTITY_INSERT [dbo].[CARDS] OFF
GO
SET IDENTITY_INSERT [dbo].[CARDS_TYPES] ON 

INSERT [dbo].[CARDS_TYPES] ([card_type_id], [card_type_name]) VALUES (1, N'CAÑON')
INSERT [dbo].[CARDS_TYPES] ([card_type_id], [card_type_name]) VALUES (2, N'GLOBO')
INSERT [dbo].[CARDS_TYPES] ([card_type_id], [card_type_name]) VALUES (3, N'BARCO')
INSERT [dbo].[CARDS_TYPES] ([card_type_id], [card_type_name]) VALUES (4, N'COMODÍN')
INSERT [dbo].[CARDS_TYPES] ([card_type_id], [card_type_name]) VALUES (1002, N'CONQUISTA')
INSERT [dbo].[CARDS_TYPES] ([card_type_id], [card_type_name]) VALUES (1003, N'DESTRUCCION')
SET IDENTITY_INSERT [dbo].[CARDS_TYPES] OFF
GO
SET IDENTITY_INSERT [dbo].[COLORS] ON 

INSERT [dbo].[COLORS] ([color_id], [color_name], [hex_code]) VALUES (1, N'RED', NULL)
INSERT [dbo].[COLORS] ([color_id], [color_name], [hex_code]) VALUES (2, N'BLUE', NULL)
INSERT [dbo].[COLORS] ([color_id], [color_name], [hex_code]) VALUES (3, N'GREEN', NULL)
INSERT [dbo].[COLORS] ([color_id], [color_name], [hex_code]) VALUES (4, N'YELLOW', NULL)
INSERT [dbo].[COLORS] ([color_id], [color_name], [hex_code]) VALUES (5, N'BLACK', NULL)
INSERT [dbo].[COLORS] ([color_id], [color_name], [hex_code]) VALUES (6, N'WHITE', NULL)
SET IDENTITY_INSERT [dbo].[COLORS] OFF
GO
SET IDENTITY_INSERT [dbo].[CONTINENT] ON 

INSERT [dbo].[CONTINENT] ([continent_id], [continent_name]) VALUES (1, N'América del Norte')
INSERT [dbo].[CONTINENT] ([continent_id], [continent_name]) VALUES (2, N'América del Sur')
INSERT [dbo].[CONTINENT] ([continent_id], [continent_name]) VALUES (3, N'Europa')
INSERT [dbo].[CONTINENT] ([continent_id], [continent_name]) VALUES (4, N'Asia')
INSERT [dbo].[CONTINENT] ([continent_id], [continent_name]) VALUES (5, N'África')
INSERT [dbo].[CONTINENT] ([continent_id], [continent_name]) VALUES (6, N'Oceanía')
SET IDENTITY_INSERT [dbo].[CONTINENT] OFF
GO
SET IDENTITY_INSERT [dbo].[COUNTRY] ON 

INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (1, N'Canadá', 62, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (2, N'Yukón', 2, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (3, N'Alaska', 62, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (4, N'Groenlandia', 2, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (5, N'Oregón', 1, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (6, N'California', 2, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (7, N'México', 62, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (8, N'Nueva York', 2, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (9, N'Terranova', 1, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (10, N'Labrador', 62, 1, 1)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (11, N'Argentina', 2, 1, 2)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (12, N'Brasil', 1, 1, 2)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (13, N'Perú', 1, 1, 2)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (14, N'Colombia', 62, 1, 2)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (15, N'Chile', 2, 1, 2)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (16, N'Uruguay', 62, 1, 2)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (17, N'Gran Bretaña', 1, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (18, N'Islandia', 2, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (19, N'España', 1, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (20, N'Francia', 62, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (21, N'Alemania', 1, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (22, N'Italia', 62, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (23, N'Polonia', 2, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (24, N'Rusia', 62, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (25, N'Suecia', 1, 1, 3)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (26, N'Arabia', 62, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (27, N'Aral', 2, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (28, N'China', 1, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (29, N'India', 2, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (30, N'Irán', 2, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (31, N'Tartaria', 1, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (32, N'Taymyr', 62, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (33, N'Japón', 1, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (34, N'Kamchatka', 1, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (35, N'Siberia', 1, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (36, N'Mongolia', 1, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (37, N'Gobi', 2, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (38, N'Malasia', 2, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (39, N'Turquía', 1, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (40, N'Israel', 2, 1, 4)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (41, N'Sahara', 62, 1, 5)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (42, N'Etiopía', 2, 1, 5)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (43, N'Egipto', 62, 1, 5)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (44, N'Madagascar', 1, 1, 5)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (45, N'Zaire', 2, 1, 5)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (46, N'Sudáfrica', 62, 1, 5)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (47, N'Sumatra', 62, 1, 6)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (48, N'Borneo', 1, 1, 6)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (49, N'Java', 2, 1, 6)
INSERT [dbo].[COUNTRY] ([country_id], [country_name], [controlling_player_id], [base_armies], [continent_id]) VALUES (50, N'Australia', 62, 1, 6)
SET IDENTITY_INSERT [dbo].[COUNTRY] OFF
GO
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (1, 2)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (1, 5)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (1, 9)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (3, 2)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (3, 34)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (5, 1)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (5, 2)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (5, 3)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (9, 1)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (9, 10)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (10, 9)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (11, 12)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (11, 13)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (11, 15)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (11, 16)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (13, 12)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (15, 13)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (16, 12)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (16, 13)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (17, 18)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (17, 19)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (18, 25)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (19, 20)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (19, 41)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (20, 21)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (20, 22)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (21, 17)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (21, 22)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (21, 23)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (22, 21)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (23, 24)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (23, 43)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (24, 25)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (24, 27)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (24, 30)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (24, 39)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (26, 39)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (26, 40)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (27, 31)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (27, 35)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (28, 29)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (28, 34)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (28, 35)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (28, 36)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (28, 37)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (28, 38)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (29, 30)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (29, 38)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (29, 47)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (30, 27)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (30, 36)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (30, 39)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (31, 32)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (31, 35)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (32, 3)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (32, 34)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (32, 35)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (33, 28)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (33, 34)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (35, 34)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (35, 36)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (36, 27)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (36, 37)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (37, 30)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (37, 36)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (37, 38)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (39, 23)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (39, 40)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (39, 43)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (40, 43)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (41, 12)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (41, 42)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (41, 43)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (41, 45)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (42, 43)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (42, 45)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (43, 44)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (44, 45)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (45, 46)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (46, 42)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (47, 29)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (47, 50)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (48, 38)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (49, 50)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (50, 15)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (50, 48)
INSERT [dbo].[COUNTRY_BORDER] ([country_id], [neighbor_id]) VALUES (50, 49)
GO
SET IDENTITY_INSERT [dbo].[DEAL] ON 

INSERT [dbo].[DEAL] ([deal_id], [deal_name], [deal_type_id], [game_id]) VALUES (1, N'Pacto Azul-Rojo', 1, NULL)
INSERT [dbo].[DEAL] ([deal_id], [deal_name], [deal_type_id], [game_id]) VALUES (2, N'Zona Neutral', 5, NULL)
SET IDENTITY_INSERT [dbo].[DEAL] OFF
GO
SET IDENTITY_INSERT [dbo].[DEAL_PLAYERS] ON 

INSERT [dbo].[DEAL_PLAYERS] ([deal_player_id], [deal_id], [game_player_id]) VALUES (1, 1, NULL)
INSERT [dbo].[DEAL_PLAYERS] ([deal_player_id], [deal_id], [game_player_id]) VALUES (2, 1, NULL)
INSERT [dbo].[DEAL_PLAYERS] ([deal_player_id], [deal_id], [game_player_id]) VALUES (3, 2, NULL)
SET IDENTITY_INSERT [dbo].[DEAL_PLAYERS] OFF
GO
SET IDENTITY_INSERT [dbo].[GAME_PLAYERS] ON 

INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (4, 1, 3, 1, 15, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (5, 2, 3, 2, 15, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (6, 3, 3, 3, 15, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (7, 8, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (8, 5, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (9, 5, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (10, 8, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (11, 8, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (12, 5, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (13, 5, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (14, 8, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (15, 5, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (16, 8, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (17, 7, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (18, 6, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (19, 5, 5, 3, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (20, 5, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (21, 6, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (22, 7, 5, 3, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (23, 5, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (24, 7, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (25, 6, 5, 3, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (26, 7, 5, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (27, 5, 5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (28, 6, 5, 3, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (102, 46, 106, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (103, 3, 106, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (104, 48, 107, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (105, 3, 107, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (106, 49, 108, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (107, 1, 108, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (108, 49, 109, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (109, 1, 109, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (110, 49, 110, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (111, 2, 110, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (112, 49, 111, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (113, 1, 111, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (114, 50, 112, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (115, 2, 112, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (116, 50, 113, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (117, 2, 113, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (118, 51, 114, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (119, 1, 114, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (120, 51, 115, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (121, 2, 115, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (122, 51, 116, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (123, 2, 116, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (124, 51, 117, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (125, 2, 117, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (126, 51, 118, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (127, 2, 118, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (128, 51, 119, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (129, 1, 119, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (130, 53, 120, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (131, 1, 120, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (134, 54, 123, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (135, 1, 123, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (136, 54, 124, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (137, 1, 124, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (138, 55, 125, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (139, 1, 125, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (140, 56, 126, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (141, 1, 126, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (142, 57, 127, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (143, 1, 127, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (144, 57, 128, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (145, 1, 128, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (146, 58, 129, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (147, 1, 129, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (148, 58, 130, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (149, 1, 130, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (150, 58, 131, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (151, 1, 131, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (152, 59, 132, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (153, 1, 132, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (154, 62, 133, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (155, 1, 133, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1154, 62, 1133, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1155, 1, 1133, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1156, 1062, 1134, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1157, 1, 1134, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1158, 1063, 1135, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1159, 1, 1135, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1160, 1063, 1136, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1161, 1, 1136, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1181, 1066, 1144, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1182, 1, 1144, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1183, 1066, 1145, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1184, 1, 1145, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1185, 1066, 1146, 1, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1186, 1, 1146, 2, 0, 0, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1204, 1066, 1156, NULL, NULL, NULL, 1, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1207, 1066, 1158, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1208, 1066, 1159, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1209, NULL, 1159, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1210, 1066, 1160, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1211, NULL, 1160, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1212, NULL, 1160, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1213, NULL, 1160, NULL, NULL, NULL, NULL, N'AMATEUR')
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1214, NULL, 1160, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1215, NULL, 1160, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1216, 1066, 1161, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1217, 1066, 1162, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1218, 1066, 1163, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1219, 1066, 1164, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1220, 1066, 1165, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1221, 1066, 1166, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1222, 1066, 1167, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1223, 1, 1167, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1224, 2, 1167, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1225, 3, 1167, NULL, NULL, NULL, NULL, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1226, 1066, 1168, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1227, 1, 1168, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1228, 2, 1168, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1229, 3, 1168, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1230, 1066, 1169, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1231, 1, 1169, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1232, 2, 1169, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1233, 3, 1169, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1234, 1066, 1170, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1235, 1, 1170, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1236, 2, 1170, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1237, 3, 1170, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1241, 1066, 1174, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1245, 1066, 1177, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1246, 1, 1177, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1247, 1066, 1178, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1248, 1, 1178, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1249, 1066, 1179, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1250, 1, 1179, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1251, 2, 1179, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1252, 3, 1179, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1253, 62, 1180, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1254, 1, 1180, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1255, 2, 1180, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1256, 3, 1180, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1257, 62, 1181, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1258, 1, 1181, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1259, 2, 1181, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1260, 3, 1181, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1261, 62, 1182, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1262, 1, 1182, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1263, 2, 1182, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1264, 3, 1182, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1265, 62, 1183, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1266, 1, 1183, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1267, 2, 1183, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1268, 3, 1183, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1269, 62, 1184, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1270, 1, 1184, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1271, 2, 1184, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1272, 3, 1184, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1273, 62, 1185, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1274, 1, 1185, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1275, 2, 1185, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1276, 3, 1185, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1277, 62, 1186, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1278, 1, 1186, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1279, 2, 1186, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1280, 3, 1186, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1281, 62, 1187, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1282, 1, 1187, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1283, 2, 1187, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1284, 3, 1187, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1285, 62, 1188, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1286, 1, 1188, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1287, 2, 1188, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1288, 3, 1188, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1289, 62, 1189, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1290, 1, 1189, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1291, 2, 1189, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1292, 3, 1189, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1293, 62, 1190, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1294, 1, 1190, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1295, 2, 1190, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1296, 3, 1190, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1297, 62, 1191, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1298, 1, 1191, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1299, 2, 1191, 1, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1300, 3, 1191, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1301, 1063, 1192, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1302, 1, 1192, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1303, 1063, 1193, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1304, 1, 1193, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1305, 1063, 1194, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1306, 1, 1194, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1307, 1063, 1195, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1308, 1, 1195, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1309, 1063, 1196, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1310, 1, 1196, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1311, 2, 1196, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1312, 1063, 1197, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1313, 1, 1197, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1314, 1063, 1198, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1315, 1, 1198, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1316, 1063, 1199, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1317, 1, 1199, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1318, 1063, 1200, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1319, 1, 1200, NULL, NULL, NULL, 4, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1320, 1063, 1201, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1321, 1, 1201, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1322, 1063, 1202, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1323, 1, 1202, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1324, 1063, 1203, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1325, 1, 1203, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1326, 2, 1203, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1327, 62, 1204, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1328, 1, 1204, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1329, 2, 1204, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1330, 3, 1204, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1331, 62, 1205, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1332, 1, 1205, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1333, 2, 1205, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1334, 3, 1205, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1335, 62, 1206, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1336, 1, 1206, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1337, 2, 1206, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1338, 3, 1206, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1339, 62, 1207, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1340, 1, 1207, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1341, 2, 1207, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1342, 3, 1207, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1343, 62, 1208, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1344, 1, 1208, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1345, 2, 1208, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1346, 3, 1208, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1347, 1063, 1209, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1348, 1, 1209, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1349, 2, 1209, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1350, 1063, 1210, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1351, 1, 1210, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1352, 1063, 1211, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1353, 1, 1211, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1354, 1063, 1212, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1355, 1, 1212, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1356, 2, 1212, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1357, 1063, 1213, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1358, 1, 1213, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1359, 1063, 1214, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1360, 1, 1214, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1361, 2, 1214, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1362, 3, 1214, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1363, 1063, 1215, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1364, 1, 1215, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1365, 2, 1215, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1366, 3, 1215, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1367, 1063, 1216, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1368, 1, 1216, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1369, 1063, 1217, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1370, 1, 1217, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1371, 2, 1217, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1372, 3, 1217, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1373, 1063, 1218, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1374, 1, 1218, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1375, 2, 1218, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1376, 3, 1218, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1377, 1063, 1219, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1378, 1, 1219, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1379, 2, 1219, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1380, 3, 1219, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1381, 4, 1219, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1384, 1063, 1221, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1385, 1, 1221, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1386, 1063, 1222, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1387, 1, 1222, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1388, 2, 1222, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1389, 1063, 1223, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1390, 1, 1223, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1391, 1063, 1224, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1392, 1, 1224, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1393, 1063, 1225, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1394, 1, 1225, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1395, 57, 1226, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1396, 1, 1226, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1397, 2, 1226, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1398, 3, 1226, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1399, 57, 1227, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1400, 1, 1227, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1401, 2, 1227, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1402, 3, 1227, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1403, 62, 1228, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1404, 1, 1228, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1405, 2, 1228, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1406, 3, 1228, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1407, 62, 1229, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1408, 1, 1229, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1409, 2, 1229, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1410, 3, 1229, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1411, 4, 1229, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1412, 5, 1229, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1413, 1063, 1230, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1414, 1, 1230, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1415, 1063, 1231, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1416, 1, 1231, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1417, 1063, 1232, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1418, 1, 1232, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1419, 2, 1232, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1422, 1063, 1234, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1423, 1, 1234, 1, NULL, NULL, 6, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1424, 2, 1234, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1425, 57, 1235, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1426, 1, 1235, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1427, 2, 1235, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1428, 3, 1235, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1433, 1063, 1237, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1434, 1, 1237, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1435, 2, 1237, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1436, 62, 1238, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1437, 1, 1238, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1438, 2, 1238, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1439, 3, 1238, 5, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1440, 4, 1238, 6, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1441, 5, 1238, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1442, 1063, 1239, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1443, 1, 1239, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1444, 2, 1239, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1445, 62, 1240, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1446, 1, 1240, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1447, 2, 1240, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1448, 3, 1240, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1449, 1063, 1241, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1450, 1, 1241, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1451, 1063, 1242, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1452, 1, 1242, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1453, 2, 1242, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1458, 62, 1244, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1459, 1, 1244, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1460, 2, 1244, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1461, 3, 1244, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1462, 62, 1245, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1463, 1, 1245, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1464, 2, 1245, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1465, 3, 1245, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1466, 62, 1246, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1467, 1, 1246, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1468, 2, 1246, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1469, 3, 1246, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1470, 1063, 1247, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1471, 1, 1247, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1472, 2, 1247, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1473, 1063, 1248, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1474, 1, 1248, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1475, 2, 1248, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1476, 1063, 1249, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1477, 1, 1249, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1478, 2, 1249, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1479, 3, 1249, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1480, 1063, 1250, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1481, 1, 1250, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1482, 2, 1250, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1483, 3, 1250, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1484, 1063, 1251, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1485, 1, 1251, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1486, 2, 1251, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1487, 3, 1251, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1488, 1074, 1252, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1489, 1, 1252, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1490, 2, 1252, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1491, 62, 1253, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1492, 1, 1253, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1493, 2, 1253, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1494, 3, 1253, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1495, 62, 1254, 5, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1496, 1, 1254, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1497, 2, 1254, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1498, 3, 1254, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1499, 57, 1255, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1500, 1, 1255, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1501, 2, 1255, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1502, 3, 1255, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1503, 1063, 1256, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1504, 1, 1256, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1505, 2, 1256, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1506, 1063, 1257, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1507, 1, 1257, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1508, 2, 1257, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1509, 3, 1257, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1510, 1074, 1258, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1511, 1, 1258, 1, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1512, 2, 1258, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1513, 3, 1258, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1514, 1063, 1259, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1515, 1, 1259, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1516, 2, 1259, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1517, 3, 1259, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1518, 1063, 1260, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1519, 1, 1260, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1520, 2, 1260, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1521, 3, 1260, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1522, 1063, 1261, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1523, 1, 1261, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1524, 2, 1261, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1525, 3, 1261, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1526, 57, 1262, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1527, 1, 1262, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1528, 2, 1262, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1529, 3, 1262, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1530, 57, 1263, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1531, 1, 1263, 2, NULL, NULL, 5, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1532, 2, 1263, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1533, 3, 1263, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1534, 1064, 1254, 4, NULL, NULL, 4, N'MEDIUM')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1535, 62, 1264, 5, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1536, 1, 1264, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1537, 2, 1264, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1538, 3, 1264, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1539, 1064, 1264, 4, NULL, NULL, 5, N'MEDIUM')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1540, 57, 1265, 1, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1541, 1, 1265, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1542, 2, 1265, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1543, 3, 1265, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1544, 57, 1266, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1545, 1, 1266, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1546, 57, 1267, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1547, 1, 1267, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1548, 1063, 1268, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1549, 1, 1268, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1550, 2, 1268, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1551, 3, 1268, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1552, 6, 1269, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1553, 1, 1269, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1554, 6, 1270, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1555, 1, 1270, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1559, 6, 1272, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1560, 1, 1272, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1561, 1063, 1273, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1562, 1, 1273, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1563, 2, 1273, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1564, 3, 1273, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1565, 1063, 1274, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1566, 1, 1274, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1567, 2, 1274, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1568, 3, 1274, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1569, 1074, 1275, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1570, 1, 1275, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1571, 2, 1275, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1572, 3, 1275, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1573, 1063, 1276, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1574, 1, 1276, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1575, 2, 1276, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1576, 3, 1276, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1577, 1063, 1277, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1578, 1, 1277, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1579, 2, 1277, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1580, 3, 1277, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1581, 1063, 1278, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1582, 1, 1278, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1583, 2, 1278, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1584, 3, 1278, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1585, 1075, 1279, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1586, 1, 1279, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1587, 2, 1279, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1588, 3, 1279, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1589, 1075, 1280, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1590, 1, 1280, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1591, 2, 1280, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1592, 3, 1280, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1593, 1076, 1281, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1594, 1, 1281, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1595, 2, 1281, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1596, 3, 1281, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1597, 1063, 1282, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1598, 1, 1282, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1599, 2, 1282, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1600, 3, 1282, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1601, 1074, 1283, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1602, 1, 1283, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1603, 2, 1283, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1604, 3, 1283, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1605, 1063, 1284, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1606, 1, 1284, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1607, 2, 1284, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1608, 3, 1284, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1609, 1075, 1285, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1610, 1, 1285, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1611, 2, 1285, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1612, 3, 1285, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1613, 1063, 1286, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1614, 1, 1286, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1615, 2, 1286, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1616, 3, 1286, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1617, 1074, 1287, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1618, 1, 1287, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1619, 2, 1287, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1620, 3, 1287, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1621, 1074, 1288, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1622, 1, 1288, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1623, 2, 1288, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1624, 3, 1288, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1625, 1074, 1289, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1626, 1, 1289, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1627, 2, 1289, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1628, 3, 1289, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1629, 4, 1289, 5, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1630, 1074, 1290, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1631, 1, 1290, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1632, 2, 1290, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1633, 3, 1290, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1634, 6, 1291, NULL, NULL, NULL, 3, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1635, 1, 1291, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1636, 2, 1291, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1637, 1063, 1292, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1638, 1, 1292, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1639, 2, 1292, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1640, 3, 1292, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1641, 1063, 1293, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1642, 1, 1293, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1643, 2, 1293, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1644, 3, 1293, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1649, 1063, 1295, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1650, 1, 1295, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1651, 2, 1295, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1652, 3, 1295, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1653, 62, 1296, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1654, 1, 1296, 1, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1655, 2, 1296, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1656, 62, 1297, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1657, 1, 1297, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1658, 2, 1297, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1659, 1074, 1298, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1660, 1, 1298, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1661, 2, 1298, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1662, 3, 1298, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1663, 57, 1299, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1664, 1, 1299, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1665, 2, 1299, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1666, 3, 1299, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1667, 1074, 1300, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1668, 1, 1300, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1669, 2, 1300, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1670, 3, 1300, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1671, 1074, 1301, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1672, 1, 1301, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1673, 2, 1301, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1674, 3, 1301, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1675, 1074, 1302, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1676, 1, 1302, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1677, 2, 1302, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1678, 3, 1302, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1684, 1074, 1304, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1685, 1, 1304, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1686, 2, 1304, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1687, 3, 1304, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1688, 62, 1305, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1689, 1, 1305, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1690, 2, 1305, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1691, 1074, 1306, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1692, 1, 1306, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1693, 2, 1306, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1694, 3, 1306, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1695, 1074, 1307, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1696, 1, 1307, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1697, 2, 1307, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1698, 3, 1307, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1699, 1074, 1308, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1700, 1, 1308, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1701, 2, 1308, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1702, 3, 1308, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1703, 1074, 1309, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1704, 1, 1309, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1705, 2, 1309, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1706, 3, 1309, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1707, 1074, 1310, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1708, 1, 1310, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1709, 2, 1310, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1710, 3, 1310, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1711, 1074, 1311, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1712, 1, 1311, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1713, 2, 1311, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1714, 1074, 1312, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1715, 1, 1312, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1716, 2, 1312, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1717, 3, 1312, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1718, 1074, 1313, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1719, 1, 1313, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1720, 2, 1313, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1721, 1074, 1314, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1722, 1, 1314, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1723, 2, 1314, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1724, 3, 1314, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1725, 1074, 1315, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1726, 1, 1315, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1727, 2, 1315, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1728, 3, 1315, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1729, 1074, 1316, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1730, 1, 1316, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1731, 2, 1316, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1732, 3, 1316, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1733, 4, 1316, 5, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1734, 1074, 1317, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1735, 1, 1317, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1736, 2, 1317, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1737, 3, 1317, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1738, 1074, 1318, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1739, 1, 1318, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1740, 2, 1318, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1741, 3, 1318, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1742, 1074, 1319, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1743, 1, 1319, 2, NULL, NULL, 6, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1744, 2, 1319, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1745, 3, 1319, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1746, 1063, 1320, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1747, 1, 1320, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1748, 2, 1320, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1749, 1074, 1321, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1750, 1, 1321, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1751, 2, 1321, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1752, 3, 1321, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1753, 1074, 1322, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1754, 1, 1322, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1755, 2, 1322, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1756, 3, 1322, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1757, 1074, 1323, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1758, 1, 1323, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1759, 2, 1323, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1760, 3, 1323, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1761, 1074, 1324, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1762, 1, 1324, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1763, 2, 1324, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1764, 3, 1324, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1768, 1074, 1326, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1769, 1, 1326, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1770, 2, 1326, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1771, 3, 1326, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1772, 1063, 1327, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1773, 1, 1327, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1774, 2, 1327, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1775, 3, 1327, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1776, 1074, 1328, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1777, 1, 1328, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1778, 2, 1328, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1779, 1063, 1329, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1780, 1, 1329, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1781, 2, 1329, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1782, 3, 1329, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1783, 1074, 1330, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1784, 1, 1330, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1785, 2, 1330, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1786, 3, 1330, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1787, 1074, 1331, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1788, 1, 1331, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1789, 2, 1331, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1790, 3, 1331, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1791, 1074, 1332, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1792, 1, 1332, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1793, 2, 1332, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1794, 3, 1332, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1795, 4, 1332, 5, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1796, 1074, 1333, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1797, 1, 1333, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1798, 2, 1333, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1799, 3, 1333, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1800, 1063, 1334, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1801, 1, 1334, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1802, 2, 1334, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1803, 1074, 1335, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1804, 1, 1335, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1805, 2, 1335, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1806, 3, 1335, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1807, 1063, 1336, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1808, 1, 1336, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1809, 2, 1336, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1810, 1063, 1337, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1811, 1, 1337, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1812, 2, 1337, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1813, 1063, 1338, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1814, 1, 1338, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1815, 2, 1338, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1816, 62, 1339, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1817, 1, 1339, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1818, 2, 1339, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1819, 3, 1339, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1820, 1064, 1339, 5, NULL, NULL, 2, N'MEDIUM')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1821, 1074, 1340, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1822, 1, 1340, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1823, 2, 1340, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1824, 3, 1340, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1825, 1074, 1341, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1826, 1, 1341, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1827, 2, 1341, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1828, 3, 1341, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1829, 4, 1341, 5, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1830, 57, 1342, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1831, 1, 1342, 1, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1832, 2, 1342, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1833, 3, 1342, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1834, 1074, 1343, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1835, 1, 1343, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1836, 2, 1343, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1837, 3, 1343, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1838, 4, 1343, 5, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1839, 1074, 1344, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1840, 1, 1344, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1841, 2, 1344, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1842, 3, 1344, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1843, 4, 1344, 5, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1844, 1063, 1345, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1845, 1, 1345, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1846, 2, 1345, NULL, NULL, NULL, 5, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1847, 57, 1345, NULL, NULL, NULL, 1, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1848, 6, 1345, NULL, NULL, NULL, 4, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1849, 1063, 1346, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1850, 1, 1346, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1851, 6, 1346, NULL, NULL, NULL, 3, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1852, 1063, 1347, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1853, 1, 1347, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1854, 6, 1347, 3, NULL, NULL, 3, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1855, 1063, 1348, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1856, 1, 1348, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1857, 2, 1348, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1858, 6, 1348, 4, NULL, NULL, 5, N'MEDIUM')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1859, 1063, 1349, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1860, 1, 1349, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1861, 2, 1349, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1862, 6, 1349, 4, NULL, NULL, 2, N'MEDIUM')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1863, 1063, 1350, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1864, 1, 1350, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1865, 2, 1350, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1866, 6, 1351, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1867, 1, 1351, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1868, 2, 1351, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1869, 1063, 1351, 4, NULL, NULL, 4, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1870, 57, 1352, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1871, 1, 1352, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1872, 2, 1352, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1873, 3, 1352, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1874, 1063, 1353, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1875, 1, 1353, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1876, 2, 1353, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1877, 57, 1354, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1878, 1, 1354, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1879, 2, 1354, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1880, 3, 1354, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1881, 1063, 1355, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1882, 1, 1355, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1883, 2, 1355, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1884, 1063, 1356, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1885, 1, 1356, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1886, 57, 1356, 2, NULL, NULL, 3, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1887, 6, 1356, 3, NULL, NULL, 4, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1888, 1063, 1357, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1889, 1, 1357, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1890, 57, 1357, 1, NULL, NULL, 4, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1891, 6, 1357, 2, NULL, NULL, 5, N'AMATEUR')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1892, 1063, 1358, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1893, 1, 1358, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1894, 2, 1358, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1895, 6, 1359, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1896, 1, 1359, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1897, 2, 1359, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1898, 6, 1360, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1899, 1, 1360, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1900, 2, 1360, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1901, 3, 1360, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1902, 4, 1360, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1903, 62, 1361, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1904, 1, 1361, 5, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1905, 2, 1361, 6, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1906, 3, 1361, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1907, 4, 1361, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1908, 5, 1361, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1909, 1063, 1362, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1910, 1, 1362, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1911, 2, 1362, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1912, 1063, 1363, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1913, 1, 1363, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1914, 2, 1363, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1915, 6, 1364, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1916, 1, 1364, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1917, 6, 1365, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1918, 1, 1365, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1919, 2, 1365, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1920, 3, 1365, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1921, 6, 1366, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1922, 1, 1366, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1923, 2, 1366, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1924, 3, 1366, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1925, 1063, 1367, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1926, 1, 1367, 1, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1927, 2, 1367, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1928, 6, 1368, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1929, 1, 1368, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1930, 2, 1368, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1931, 1063, 1369, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1932, 1, 1369, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1933, 2, 1369, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1934, 6, 1370, 4, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1935, 1, 1370, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1936, 2, 1370, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1937, 3, 1370, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1938, 6, 1371, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1939, 1, 1371, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1940, 2, 1371, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1941, 3, 1371, 4, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1942, 1074, 1372, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1943, 1, 1372, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1944, 2, 1372, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1945, 3, 1372, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1946, 4, 1372, 5, NULL, NULL, 3, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1947, 6, 1373, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1948, 1, 1373, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1949, 6, 1374, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1950, 1, 1374, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1951, 2, 1374, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1952, 1063, 1375, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1953, 1, 1375, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1954, 2, 1375, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1955, 1074, 1376, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1956, 1, 1376, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1957, 2, 1376, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1958, 3, 1376, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1959, 4, 1376, 5, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1960, 6, 1377, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1961, 1, 1377, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1962, 6, 1378, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1963, 1, 1378, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1964, 2, 1378, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1965, 1063, 1379, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1966, 1, 1379, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1967, 2, 1379, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1973, 1074, 1381, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1974, 1, 1381, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1975, 2, 1381, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1976, 3, 1381, 4, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1977, 4, 1381, 5, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1978, 6, 1382, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1979, 1, 1382, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1980, 6, 1383, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1981, 1, 1383, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1982, 2, 1383, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1983, 1063, 1384, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1984, 1, 1384, 1, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1985, 2, 1384, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1986, 6, 1385, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1987, 1, 1385, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1988, 6, 1386, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1989, 1, 1386, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1990, 2, 1386, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1991, 1063, 1387, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1992, 1, 1387, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1993, 2, 1387, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1994, 6, 1388, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1995, 1, 1388, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1996, 6, 1389, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1997, 1, 1389, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1998, 2, 1389, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (1999, 1063, 1390, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2000, 1, 1390, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2001, 2, 1390, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2002, 3, 1390, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2003, 6, 1391, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2004, 1, 1391, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2005, 2, 1391, 3, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2006, 6, 1392, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2007, 1, 1392, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2008, 2, 1392, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2009, 6, 1393, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2010, 1, 1393, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2011, 6, 1394, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2012, 1, 1394, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2013, 2, 1394, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2014, 3, 1394, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2015, 6, 1395, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2016, 1, 1395, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2017, 2, 1395, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2018, 62, 1396, 6, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2019, 1, 1396, 1, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2020, 2, 1396, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2021, 3, 1396, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2022, 4, 1396, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2023, 5, 1396, 5, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2024, 6, 1397, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2025, 1, 1397, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2026, 6, 1398, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2027, 1, 1398, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2028, 6, 1399, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2029, 1, 1399, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2030, 6, 1400, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2031, 1, 1400, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2032, 2, 1400, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2033, 6, 1401, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2034, 1, 1401, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2035, 6, 1402, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2036, 1, 1402, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2037, 2, 1402, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2038, 62, 1403, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2039, 1, 1403, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2040, 2, 1403, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2041, 6, 1404, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2042, 1, 1404, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2043, 2, 1404, 3, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2044, 6, 1405, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2045, 1, 1405, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2046, 2, 1405, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2047, 57, 1406, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2048, 1, 1406, 1, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2049, 2, 1406, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2050, 57, 1407, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2051, 1, 1407, 4, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2052, 2, 1407, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2053, 3, 1407, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2054, 57, 1408, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2055, 1, 1408, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2056, 2, 1408, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2057, 6, 1409, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2058, 1, 1409, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2059, 57, 1410, 4, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2060, 1, 1410, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2061, 2, 1410, 2, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2062, 3, 1410, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2063, 6, 1411, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2064, 1, 1411, NULL, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2065, 6, 1412, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2066, 1, 1412, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2067, 6, 1413, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2068, 1, 1413, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2069, 6, 1414, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2070, 1, 1414, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2071, 6, 1415, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2072, 1, 1415, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2073, 57, 1416, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2074, 1, 1416, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2075, 2, 1416, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2076, 3, 1416, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2077, 6, 1417, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2078, 1, 1417, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2079, 6, 1418, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2080, 1, 1418, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2081, 2, 1418, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2082, 3, 1418, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2083, 1063, 1419, 1, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2084, 1, 1419, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2085, 2, 1419, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2086, 1063, 1420, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2087, 1, 1420, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2088, 57, 1420, 3, NULL, NULL, 2, N'MEDIUM')
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2089, 6, 1421, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2090, 1, 1421, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2091, 2, 1421, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2092, 3, 1421, 4, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2093, 62, 1422, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2094, 1, 1422, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2095, 2, 1422, 3, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2096, 3, 1422, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2097, 62, 1423, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2098, 1, 1423, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2099, 2, 1423, 1, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2100, 62, 1424, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2101, 1, 1424, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2102, 2, 1424, 3, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2103, 62, 1425, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2104, 1, 1425, 2, NULL, NULL, 6, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2105, 2, 1425, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2106, 62, 1426, 1, NULL, NULL, 2, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2107, 1, 1426, 2, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2108, 2, 1426, 3, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2109, 3, 1426, 4, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2110, 62, 1427, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2111, 1, 1427, 2, NULL, NULL, 5, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2112, 2, 1427, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2113, 62, 1428, 1, NULL, NULL, 3, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2114, 1, 1428, 2, NULL, NULL, 4, NULL)
INSERT [dbo].[GAME_PLAYERS] ([games_players_id], [player_id], [game_id], [turn_order], [player_army], [wait_turns], [color_id], [difficulty_level]) VALUES (2115, 2, 1428, 3, NULL, NULL, 6, NULL)
SET IDENTITY_INSERT [dbo].[GAME_PLAYERS] OFF
GO
SET IDENTITY_INSERT [dbo].[GAMES] ON 

INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (3, CAST(N'2025-05-30T01:02:35.503' AS DateTime), 2, N'1', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (4, CAST(N'2025-05-30T01:02:35.503' AS DateTime), 1, N'1', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (5, CAST(N'2025-06-06T23:55:34.377' AS DateTime), 2, N'RONDA_1', 7, 5, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (6, CAST(N'2025-05-30T01:03:59.887' AS DateTime), 1, N'1', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (7, NULL, 1, N'1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (10, NULL, 1, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (11, NULL, 1, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (12, NULL, 1, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (13, NULL, 1, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (14, NULL, 1, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (15, NULL, 3, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (16, NULL, 2, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (17, NULL, 1, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (18, NULL, 2, N'0', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (19, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (20, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (21, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (22, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (23, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (24, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (25, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (26, NULL, 2, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (27, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (28, NULL, 2, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (29, NULL, 2, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (30, CAST(N'2025-06-06T19:44:43.990' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (31, CAST(N'2025-06-06T19:58:17.803' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (32, CAST(N'2025-06-06T20:24:02.517' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (33, CAST(N'2025-06-06T20:25:12.827' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (34, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (35, CAST(N'2025-06-06T21:31:19.660' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (36, CAST(N'2025-06-06T21:40:16.323' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (37, CAST(N'2025-06-06T23:08:29.560' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (38, CAST(N'2025-06-06T23:21:40.527' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (39, CAST(N'2025-06-06T23:23:28.880' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (40, CAST(N'2025-06-06T23:29:40.290' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (41, CAST(N'2025-06-06T23:34:53.273' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (42, CAST(N'2025-06-06T23:49:05.077' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (43, CAST(N'2025-06-06T23:53:27.007' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (44, CAST(N'2025-06-06T23:57:12.770' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (45, CAST(N'2025-06-07T00:07:57.657' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (46, CAST(N'2025-06-07T00:08:53.260' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (47, CAST(N'2025-06-07T00:21:33.500' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (48, CAST(N'2025-06-07T00:46:20.847' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (51, CAST(N'2025-06-07T12:50:26.363' AS DateTime), 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (52, CAST(N'2025-06-07T13:18:46.267' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (54, CAST(N'2025-06-07T13:45:25.830' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (57, CAST(N'2025-06-07T13:55:38.053' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (106, CAST(N'2025-06-08T16:28:16.323' AS DateTime), 3, N'ESPERANDO_JUGADORES', NULL, 46, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (107, CAST(N'2025-06-08T16:33:57.347' AS DateTime), 3, N'ESPERANDO_JUGADORES', NULL, 48, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (108, CAST(N'2025-06-08T16:40:52.880' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 49, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (109, CAST(N'2025-06-08T16:43:25.463' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 49, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (110, CAST(N'2025-06-08T18:46:52.210' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 49, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (111, CAST(N'2025-06-08T18:48:35.373' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 49, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (112, CAST(N'2025-06-08T19:09:44.110' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 50, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (113, CAST(N'2025-06-08T19:13:52.063' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 50, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (114, CAST(N'2025-06-08T23:58:17.033' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 51, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (115, CAST(N'2025-06-09T00:06:58.830' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 51, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (116, CAST(N'2025-06-09T00:08:26.503' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 51, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (117, CAST(N'2025-06-09T00:15:29.130' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 51, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (118, CAST(N'2025-06-09T00:22:48.443' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 51, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (119, CAST(N'2025-06-09T00:39:11.927' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 51, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (120, CAST(N'2025-06-09T04:33:03.340' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 53, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (123, CAST(N'2025-06-09T05:14:58.510' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 54, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (124, CAST(N'2025-06-09T05:40:30.890' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 54, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (125, CAST(N'2025-06-09T05:41:11.500' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 55, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (126, CAST(N'2025-06-09T19:14:49.403' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 56, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (127, CAST(N'2025-06-09T23:18:15.697' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (128, CAST(N'2025-06-10T00:33:36.963' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (129, CAST(N'2025-06-10T16:47:20.610' AS DateTime), 3, N'ESPERANDO_JUGADORES', NULL, 58, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (130, CAST(N'2025-06-10T19:18:32.217' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 58, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (131, CAST(N'2025-06-10T19:30:45.210' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 58, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (132, CAST(N'2025-06-10T19:36:39.703' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 59, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (133, CAST(N'2025-06-10T20:16:39.453' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1133, CAST(N'2025-06-22T16:52:46.803' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1134, CAST(N'2025-06-22T23:01:57.540' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1062, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1135, CAST(N'2025-06-22T23:09:46.220' AS DateTime), 3, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1136, CAST(N'2025-06-22T23:29:44.777' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1144, CAST(N'2025-06-23T22:06:34.737' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1145, CAST(N'2025-06-23T22:31:03.547' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1146, CAST(N'2025-06-23T23:21:25.647' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1156, CAST(N'2025-06-24T02:04:45.330' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1157, CAST(N'2025-06-24T02:06:10.907' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1158, CAST(N'2025-06-24T02:13:23.923' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1159, CAST(N'2025-06-24T02:16:08.317' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1160, CAST(N'2025-06-24T02:24:04.500' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1161, CAST(N'2025-06-24T02:31:57.623' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1162, CAST(N'2025-06-24T02:36:41.797' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1163, CAST(N'2025-06-24T02:36:57.010' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1164, CAST(N'2025-06-24T02:43:52.357' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, NULL, NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1165, CAST(N'2025-06-24T02:45:11.603' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1166, CAST(N'2025-06-24T02:45:54.007' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1167, CAST(N'2025-06-24T02:47:28.640' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1168, CAST(N'2025-06-24T02:51:03.937' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1169, CAST(N'2025-06-24T02:57:45.103' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1170, CAST(N'2025-06-24T03:00:41.563' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1171, CAST(N'2025-06-24T03:19:35.853' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1172, CAST(N'2025-06-24T03:24:32.010' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1173, CAST(N'2025-06-24T04:10:03.710' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
GO
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1174, CAST(N'2025-06-24T04:13:43.423' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1177, CAST(N'2025-06-24T04:28:55.220' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1178, CAST(N'2025-06-24T04:29:08.887' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1179, CAST(N'2025-06-24T04:29:21.987' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1066, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1180, CAST(N'2025-06-24T04:36:55.637' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1181, CAST(N'2025-06-24T04:40:30.957' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1182, CAST(N'2025-06-24T04:52:09.363' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1183, CAST(N'2025-06-24T04:53:26.567' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1184, CAST(N'2025-06-24T12:53:49.630' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1185, CAST(N'2025-06-24T12:54:17.777' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1186, CAST(N'2025-06-25T02:28:27.960' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1187, CAST(N'2025-06-25T02:43:08.487' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1188, CAST(N'2025-06-25T02:50:05.290' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1189, CAST(N'2025-06-26T03:42:48.073' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1190, CAST(N'2025-06-26T23:48:19.180' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1191, CAST(N'2025-06-27T02:15:37.073' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1192, CAST(N'2025-06-27T02:52:27.677' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1193, CAST(N'2025-06-27T02:54:52.493' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1194, CAST(N'2025-06-27T03:16:11.663' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1195, CAST(N'2025-06-27T03:19:27.813' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1196, CAST(N'2025-06-27T03:23:41.923' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1197, CAST(N'2025-06-27T03:25:24.267' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1198, CAST(N'2025-06-27T03:26:47.420' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1199, CAST(N'2025-06-27T03:40:51.647' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1200, CAST(N'2025-06-27T03:43:17.893' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1201, CAST(N'2025-06-27T03:45:43.217' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1202, CAST(N'2025-06-27T03:45:55.443' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1203, CAST(N'2025-06-27T03:47:15.947' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1204, CAST(N'2025-06-27T04:58:48.263' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1205, CAST(N'2025-06-27T14:31:58.090' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1206, CAST(N'2025-06-27T18:49:56.463' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1207, CAST(N'2025-06-27T18:51:56.070' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1208, CAST(N'2025-06-27T18:57:00.880' AS DateTime), 1, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1209, CAST(N'2025-06-27T20:01:08.940' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1210, CAST(N'2025-06-27T21:58:28.437' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1211, CAST(N'2025-06-27T22:05:04.193' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1212, CAST(N'2025-06-27T22:07:09.703' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1213, CAST(N'2025-06-27T23:12:34.320' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1214, CAST(N'2025-06-27T23:19:58.740' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1215, CAST(N'2025-06-27T23:57:31.097' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1216, CAST(N'2025-06-28T00:06:29.950' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1217, CAST(N'2025-06-28T00:09:13.480' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1218, CAST(N'2025-06-28T00:35:21.190' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1219, CAST(N'2025-06-28T00:39:35.563' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1221, CAST(N'2025-06-28T01:25:25.147' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1222, CAST(N'2025-06-28T01:27:39.007' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1223, CAST(N'2025-06-28T01:38:36.527' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1224, CAST(N'2025-06-28T01:58:42.210' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1225, CAST(N'2025-06-28T02:21:06.490' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1226, CAST(N'2025-06-28T02:28:04.877' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1227, CAST(N'2025-06-28T02:36:23.427' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1228, CAST(N'2025-06-28T02:36:26.280' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1229, CAST(N'2025-06-28T02:36:43.500' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1230, CAST(N'2025-06-28T02:46:32.347' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1231, CAST(N'2025-06-28T02:53:00.220' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1232, CAST(N'2025-06-28T02:53:47.303' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1234, CAST(N'2025-06-28T03:01:50.990' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1235, CAST(N'2025-06-28T03:08:24.510' AS DateTime), 2, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1237, CAST(N'2025-06-28T04:15:40.447' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1238, CAST(N'2025-06-28T04:15:48.520' AS DateTime), NULL, N'RONDA_1', NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1239, CAST(N'2025-06-28T04:18:39.587' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1240, CAST(N'2025-06-28T04:26:58.867' AS DateTime), 1, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1241, CAST(N'2025-06-28T04:29:12.543' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1242, CAST(N'2025-06-28T04:36:25.127' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1244, CAST(N'2025-06-28T04:45:55.937' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1245, CAST(N'2025-06-28T04:46:20.010' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1246, CAST(N'2025-06-28T04:46:28.067' AS DateTime), 0, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1247, CAST(N'2025-06-28T04:50:01.267' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1248, CAST(N'2025-06-28T04:53:17.193' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1249, CAST(N'2025-06-28T04:57:31.270' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1250, CAST(N'2025-06-28T05:07:43.443' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1251, CAST(N'2025-06-28T05:14:46.993' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1252, CAST(N'2025-06-28T09:38:46.197' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1253, CAST(N'2025-06-28T13:24:47.630' AS DateTime), 1, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1254, CAST(N'2025-06-28T14:39:23.100' AS DateTime), 1, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1255, CAST(N'2025-06-28T15:22:37.550' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1256, CAST(N'2025-06-28T15:32:42.280' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1257, CAST(N'2025-06-28T16:04:12.370' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1258, CAST(N'2025-06-28T16:10:27.010' AS DateTime), 1, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1259, CAST(N'2025-06-28T16:11:32.583' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1260, CAST(N'2025-06-28T16:17:16.850' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1261, CAST(N'2025-06-28T16:24:36.770' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1262, CAST(N'2025-06-28T17:13:02.287' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1263, CAST(N'2025-06-28T17:18:50.890' AS DateTime), 1, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1264, CAST(N'2025-06-28T17:42:10.370' AS DateTime), 1, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1265, CAST(N'2025-06-28T19:49:37.267' AS DateTime), 1, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1266, CAST(N'2025-06-28T20:54:56.437' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1267, CAST(N'2025-06-28T20:55:22.593' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1268, CAST(N'2025-06-28T21:04:46.673' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1269, CAST(N'2025-06-28T21:21:40.607' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1270, CAST(N'2025-06-28T21:23:05.303' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1272, CAST(N'2025-06-28T21:31:29.383' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1273, CAST(N'2025-06-28T22:19:10.133' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1274, CAST(N'2025-06-28T22:58:39.080' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1275, CAST(N'2025-06-29T00:18:48.793' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1276, CAST(N'2025-06-29T00:57:24.037' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1277, CAST(N'2025-06-29T01:09:17.517' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1278, CAST(N'2025-06-29T01:11:50.787' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1279, CAST(N'2025-06-29T01:21:48.057' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1075, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1280, CAST(N'2025-06-29T01:26:06.930' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1075, N'STARTED', NULL, NULL)
GO
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1281, CAST(N'2025-06-29T01:28:13.630' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1076, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1282, CAST(N'2025-06-29T01:38:02.353' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1283, CAST(N'2025-06-29T01:43:19.903' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1284, CAST(N'2025-06-29T01:48:56.327' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1285, CAST(N'2025-06-29T01:57:32.797' AS DateTime), 1, N'RONDA_1', NULL, 1075, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1286, CAST(N'2025-06-29T02:10:44.323' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1287, CAST(N'2025-06-29T02:55:04.857' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1288, CAST(N'2025-06-29T04:20:06.457' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1289, CAST(N'2025-06-29T11:46:30.793' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1290, CAST(N'2025-06-29T12:36:40.237' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1291, CAST(N'2025-06-29T14:02:24.027' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1292, CAST(N'2025-06-29T14:18:00.650' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1293, CAST(N'2025-06-29T14:22:15.843' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1295, CAST(N'2025-06-29T14:32:45.390' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1296, CAST(N'2025-06-29T14:50:42.583' AS DateTime), 2, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1297, CAST(N'2025-06-29T15:08:29.800' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1298, CAST(N'2025-06-29T15:10:35.813' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1299, CAST(N'2025-06-29T15:22:58.997' AS DateTime), 2, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1300, CAST(N'2025-06-29T15:50:31.513' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1301, CAST(N'2025-06-29T16:43:42.447' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1302, CAST(N'2025-06-29T17:03:37.113' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1304, CAST(N'2025-06-29T17:08:32.197' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1305, CAST(N'2025-06-29T17:12:01.393' AS DateTime), 2, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1306, CAST(N'2025-06-29T17:14:53.963' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1307, CAST(N'2025-06-29T17:24:57.337' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1308, CAST(N'2025-06-29T17:32:38.027' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1309, CAST(N'2025-06-29T17:37:48.360' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1310, CAST(N'2025-06-29T17:54:42.550' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1311, CAST(N'2025-06-29T18:32:33.867' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1312, CAST(N'2025-06-29T18:37:03.573' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1313, CAST(N'2025-06-29T18:41:04.330' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1314, CAST(N'2025-06-29T18:44:51.113' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1315, CAST(N'2025-06-29T18:58:43.327' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1316, CAST(N'2025-06-29T19:03:07.677' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1317, CAST(N'2025-06-29T19:09:21.810' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1318, CAST(N'2025-06-29T19:15:17.297' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1319, CAST(N'2025-06-29T19:19:41.493' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1320, CAST(N'2025-06-29T19:26:35.720' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1321, CAST(N'2025-06-29T19:35:43.497' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1322, CAST(N'2025-06-29T19:43:45.890' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1323, CAST(N'2025-06-29T19:57:06.000' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1324, CAST(N'2025-06-29T20:05:47.153' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1326, CAST(N'2025-06-29T20:13:15.950' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1327, CAST(N'2025-06-29T20:14:21.160' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1328, CAST(N'2025-06-29T20:23:31.440' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1329, CAST(N'2025-06-29T20:26:53.650' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1330, CAST(N'2025-06-29T20:32:00.583' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1331, CAST(N'2025-06-29T20:38:22.083' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1332, CAST(N'2025-06-29T20:40:54.203' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1333, CAST(N'2025-06-29T20:44:45.230' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1334, CAST(N'2025-06-29T20:53:32.707' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1335, CAST(N'2025-06-29T21:01:19.653' AS DateTime), NULL, NULL, NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1336, CAST(N'2025-06-29T21:27:38.170' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1337, CAST(N'2025-06-29T21:30:32.340' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1338, CAST(N'2025-06-29T21:53:55.133' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1339, CAST(N'2025-06-29T22:02:35.570' AS DateTime), 1, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1340, CAST(N'2025-06-29T22:31:16.477' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1341, CAST(N'2025-06-29T22:37:33.990' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1342, CAST(N'2025-06-29T22:42:56.507' AS DateTime), 2, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1343, CAST(N'2025-06-29T22:48:17.920' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1344, CAST(N'2025-06-29T22:51:39.417' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1345, CAST(N'2025-06-29T23:03:18.763' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1346, CAST(N'2025-06-30T00:18:37.827' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1347, CAST(N'2025-06-30T00:19:35.787' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1348, CAST(N'2025-06-30T00:24:26.310' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1349, CAST(N'2025-06-30T00:29:58.280' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1350, CAST(N'2025-06-30T01:02:37.510' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1351, CAST(N'2025-06-30T01:03:30.723' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1352, CAST(N'2025-06-30T01:19:02.450' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1353, CAST(N'2025-06-30T01:47:32.900' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1354, CAST(N'2025-06-30T01:56:51.237' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1355, CAST(N'2025-06-30T01:58:58.360' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1356, CAST(N'2025-06-30T02:06:32.107' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1357, CAST(N'2025-06-30T02:32:12.303' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1358, CAST(N'2025-06-30T13:46:29.230' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1359, CAST(N'2025-06-30T14:20:57.007' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1360, CAST(N'2025-06-30T14:21:54.660' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1361, CAST(N'2025-06-30T14:23:33.900' AS DateTime), 1, N'RONDA_1', 3, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1362, CAST(N'2025-06-30T14:47:32.960' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1363, CAST(N'2025-06-30T15:09:23.900' AS DateTime), NULL, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1364, CAST(N'2025-06-30T15:34:18.967' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1365, CAST(N'2025-06-30T15:35:56.227' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1366, CAST(N'2025-06-30T15:53:24.230' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1367, CAST(N'2025-06-30T15:54:08.060' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1368, CAST(N'2025-06-30T16:19:13.610' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1369, CAST(N'2025-06-30T16:31:55.207' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1370, CAST(N'2025-06-30T16:32:59.297' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1371, CAST(N'2025-06-30T16:52:29.830' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1372, CAST(N'2025-06-30T16:57:52.460' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1373, CAST(N'2025-06-30T16:59:04.100' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1374, CAST(N'2025-06-30T17:01:00.747' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1375, CAST(N'2025-06-30T17:24:45.650' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1376, CAST(N'2025-06-30T17:42:42.463' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1377, CAST(N'2025-06-30T17:45:36.707' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1378, CAST(N'2025-06-30T17:49:05.867' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1379, CAST(N'2025-06-30T17:54:00.737' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1381, CAST(N'2025-06-30T18:01:07.313' AS DateTime), 2, N'RONDA_1', NULL, 1074, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1382, CAST(N'2025-06-30T18:07:01.167' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1383, CAST(N'2025-06-30T18:09:52.577' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1384, CAST(N'2025-06-30T18:31:12.963' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
GO
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1385, CAST(N'2025-06-30T18:43:48.350' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1386, CAST(N'2025-06-30T18:46:16.760' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1387, CAST(N'2025-06-30T18:47:49.720' AS DateTime), 2, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1388, CAST(N'2025-06-30T18:51:46.130' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1389, CAST(N'2025-06-30T18:53:26.353' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1390, CAST(N'2025-06-30T19:02:31.397' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1391, CAST(N'2025-06-30T19:05:33.647' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1392, CAST(N'2025-06-30T19:12:56.713' AS DateTime), NULL, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1393, CAST(N'2025-06-30T19:25:06.707' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1394, CAST(N'2025-06-30T19:34:06.433' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1395, CAST(N'2025-06-30T19:41:55.603' AS DateTime), NULL, N'RONDA_1', NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1396, CAST(N'2025-06-30T19:56:07.000' AS DateTime), NULL, NULL, 5, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1397, CAST(N'2025-06-30T20:00:52.360' AS DateTime), 2, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1398, CAST(N'2025-06-30T20:02:33.057' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1399, CAST(N'2025-06-30T20:04:15.257' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1400, CAST(N'2025-06-30T20:06:09.227' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1401, CAST(N'2025-06-30T20:13:43.207' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1402, CAST(N'2025-06-30T20:15:00.823' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1403, CAST(N'2025-06-30T20:18:43.657' AS DateTime), NULL, N'RONDA_1', 62, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1404, CAST(N'2025-06-30T20:24:27.353' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1405, CAST(N'2025-06-30T20:35:07.137' AS DateTime), 2, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1406, CAST(N'2025-06-30T20:51:57.873' AS DateTime), 1, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1407, CAST(N'2025-06-30T21:03:21.837' AS DateTime), 2, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1408, CAST(N'2025-06-30T21:13:56.933' AS DateTime), 1, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1409, CAST(N'2025-06-30T21:41:05.823' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1410, CAST(N'2025-06-30T21:59:22.740' AS DateTime), 1, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1411, CAST(N'2025-06-30T22:28:16.347' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1412, CAST(N'2025-06-30T22:34:05.507' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1413, CAST(N'2025-06-30T22:37:49.157' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1414, CAST(N'2025-06-30T22:40:17.550' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1415, CAST(N'2025-06-30T22:41:33.513' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1416, CAST(N'2025-06-30T22:43:31.667' AS DateTime), 2, N'RONDA_1', NULL, 57, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1417, CAST(N'2025-06-30T22:45:35.990' AS DateTime), 1, N'ESPERANDO_JUGADORES', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1418, CAST(N'2025-06-30T22:48:29.783' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1419, CAST(N'2025-07-01T00:34:54.983' AS DateTime), 1, N'RONDA_1', NULL, 1063, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1420, CAST(N'2025-07-01T00:45:22.847' AS DateTime), NULL, NULL, NULL, NULL, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1421, CAST(N'2025-07-01T00:58:18.537' AS DateTime), 1, N'RONDA_1', NULL, 6, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1422, CAST(N'2025-07-01T02:46:13.190' AS DateTime), 2, N'RONDA_1', NULL, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1423, CAST(N'2025-07-01T03:02:39.460' AS DateTime), NULL, N'RONDA_1', 1, 62, N'STARTED', NULL, NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1424, CAST(N'2025-07-01T03:53:03.693' AS DateTime), NULL, N'RONDA_1', 1, 62, N'STARTED', N'REAGRUPACION', NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1425, CAST(N'2025-07-01T14:05:48.330' AS DateTime), 2, N'RONDA_1', 62, 62, N'STARTED', N'COLOCACION', NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1426, CAST(N'2025-07-01T14:14:30.610' AS DateTime), 1, N'RONDA_1', 62, 62, N'STARTED', N'COLOCACION', NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1427, CAST(N'2025-07-01T14:16:15.020' AS DateTime), 1, N'RONDA_1', 62, 62, N'STARTED', N'COLOCACION', NULL)
INSERT [dbo].[GAMES] ([game_id], [game_date], [game_difficulty], [game_state], [current_turn_player_id], [created_by_player_id], [turn_state], [phases_turn], [round_number]) VALUES (1428, CAST(N'2025-07-01T15:15:07.287' AS DateTime), 2, N'RONDA_1', 62, 62, N'STARTED', N'COLOCACION', NULL)
SET IDENTITY_INSERT [dbo].[GAMES] OFF
GO
SET IDENTITY_INSERT [dbo].[PLAYER_TYPES] ON 

INSERT [dbo].[PLAYER_TYPES] ([player_type_id], [player_type_name]) VALUES (1, N'Humano')
INSERT [dbo].[PLAYER_TYPES] ([player_type_id], [player_type_name]) VALUES (2, N'Bot')
SET IDENTITY_INSERT [dbo].[PLAYER_TYPES] OFF
GO
SET IDENTITY_INSERT [dbo].[PLAYERS] ON 

INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1, N'Andres', N'SoyUnBot', N'avatar111.png', CAST(N'2025-05-30T01:02:35.500' AS DateTime), CAST(N'2025-05-30T01:02:35.500' AS DateTime), CAST(N'2025-06-08T15:07:03.900' AS DateTime), 2)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (2, N'Tamara', N'SoyUnBot', N'avatar222.png', CAST(N'2025-05-30T01:02:35.500' AS DateTime), CAST(N'2025-05-30T01:02:35.500' AS DateTime), CAST(N'2025-06-08T15:07:58.427' AS DateTime), 2)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (3, N'Tomas', N'SoyUnBot', N'avatar333.png', CAST(N'2025-05-30T01:02:35.500' AS DateTime), CAST(N'2025-05-30T01:02:35.500' AS DateTime), CAST(N'2025-06-08T15:08:17.087' AS DateTime), 2)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (4, N'Fabrizio', N'SoyUnBot', N'', NULL, NULL, NULL, 2)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (5, N'Carlos', N'SoyUnBot', N'', NULL, NULL, CAST(N'2025-06-08T16:01:27.790' AS DateTime), 2)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (6, N'tamis', N'$2a$10$ADv8gVLoiF4fsiGkve2Wq.zoL47j04yWGJmay4eoRrMgnmBJV/ehu', N'', NULL, NULL, CAST(N'2025-07-01T00:57:03.590' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (7, N'andresito777', N'$2a$10$bZH6xYrZIYN0.JvnEM9Z4eyEaOD5PumJ6A1DnOesrcCSzhXUmTt9m', N'', CAST(N'2025-06-06T19:26:15.260' AS DateTime), NULL, CAST(N'2025-06-06T20:35:47.210' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (8, N'raul', N'$2a$10$axVh3.LnP2Rsn92r7rMMqOSmJKCyzydAdS2GosS5Rtfxt7sKAy0GS', N'', CAST(N'2025-06-06T19:36:38.093' AS DateTime), NULL, CAST(N'2025-06-07T14:55:32.243' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (9, N'braianrossi114080', N'$2a$10$mQB8n6m6RA/hD6cbLVzh1Owj4v12Kw18tu0ceptDqewDJZQFL6Feq', N'', CAST(N'2025-06-07T11:09:57.670' AS DateTime), NULL, CAST(N'2025-06-07T13:01:14.250' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (12, N'milanesa132456', N'$2a$10$Z8nz95f6gQzqxhCImrXxZ.CxsQA5FfrEdPYgqdG97FdDCifRZBpbS', N'', CAST(N'2025-06-07T13:43:19.333' AS DateTime), NULL, CAST(N'2025-06-07T16:56:23.857' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (13, N'Bot-Andres', N'bot_pass_hash', N'bot_avatar.png', CAST(N'2025-06-07T14:11:05.933' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (14, N'tomate', N'$2a$10$/8tQ5m2Zoi9Gge/O.9zYPenuy7iLDGzeg6Nu1Kw9m52f0hdyM11jK', N'', CAST(N'2025-06-07T15:37:11.760' AS DateTime), NULL, CAST(N'2025-06-07T16:37:19.067' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (15, N'gato123', N'$2a$10$r35TYmFNnL1DKGzqAvlXeuS1pyuIJYAMj8CcPgDYGT0wn8QocYOAC', N'', CAST(N'2025-06-07T15:57:29.840' AS DateTime), NULL, CAST(N'2025-06-07T16:57:35.777' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (16, N'holanda', N'$2a$10$Nnzh4J.4By1SwV6nyIZoc.NsXiPkmsjiK/c.7TyEE25bTjo3.NsTi', N'', CAST(N'2025-06-07T16:02:16.333' AS DateTime), NULL, CAST(N'2025-06-07T17:02:20.530' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (17, N'brasil2014', N'$2a$10$qdJCDjsCV/W1j20Ubh0P7.KJe0MAbs4Tk8v6YgT7ozTc8slztJQsW', N'', CAST(N'2025-06-07T16:04:05.947' AS DateTime), NULL, CAST(N'2025-06-07T17:04:11.323' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (18, N'mila', N'$2a$10$5eU.n2.8f0P5lx4bd30Cf.LrTTzdmzK0hKV8Z4ROEfScj8KRD8v76', N'', CAST(N'2025-06-07T19:48:45.667' AS DateTime), NULL, CAST(N'2025-06-07T20:48:56.277' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (19, N'rossi', N'$2a$10$ThwW0NQGHJvq1gvCZ6nh6uzpKWFfNYT6nnKRlEH9NyuKgV2qNPPO2', N'', CAST(N'2025-06-07T19:58:02.587' AS DateTime), NULL, CAST(N'2025-06-07T20:58:12.560' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (20, N'leonidas', N'$2a$10$wqzrBcAS6NIN5Df045BvTOP/mjdFrYEBa9H7uzxqzTgTZyLPhx5Bi', N'', CAST(N'2025-06-07T20:12:47.783' AS DateTime), NULL, CAST(N'2025-06-07T21:12:57.543' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (21, N'ja', N'$2a$10$dtUFu.lZTb23u2t9vB2fFu0iLBno7w9nngLiVGm5UbfxuhhezX6ie', N'', CAST(N'2025-06-07T20:19:37.523' AS DateTime), NULL, CAST(N'2025-06-07T21:19:44.267' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (22, N'ji', N'$2a$10$fZ//GNpWaiZFn3/zxmT3SuJypQRO3MXsD2n/Bne05R7T4Nunl2ZY2', N'', CAST(N'2025-06-07T20:29:59.590' AS DateTime), NULL, CAST(N'2025-06-07T21:30:05.590' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (23, N'qq', N'$2a$10$2c8m1Twqs861f1c/0yJ5YuZi0xDd1Mb90QQUgvearw4iIwgz3CsBm', N'', CAST(N'2025-06-07T20:32:59.197' AS DateTime), NULL, CAST(N'2025-06-07T21:33:03.867' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (24, N'aa', N'$2a$10$ELyaRoHh3nepw/os7agfou/7GllRmQHk7Atap2zSmAyCM5cj54ON2', N'', CAST(N'2025-06-07T20:41:10.897' AS DateTime), NULL, CAST(N'2025-06-07T21:41:16.007' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (28, N'br', N'$2a$10$L0Rm8ODm01tgskFx2.Kro.yoShvs7sfaQKL5kjRv8SfNQ4GC..Qkm', N'', CAST(N'2025-06-07T21:15:46.130' AS DateTime), NULL, CAST(N'2025-06-07T22:15:51.703' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (30, N'zz', N'$2a$10$LEu5P.axDgwq1NSfnmk6ducKzuh5klAWLGw9trU.Q2MwMnB/Fn0h.', N'', CAST(N'2025-06-07T21:24:03.227' AS DateTime), NULL, CAST(N'2025-06-07T22:24:08.143' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (32, N'norepetido', N'$2a$10$ER7jzQ21ma5P3r1I8Y8OL.Lg3xAj2RPMrbfi/kEHJuyGgVqPmub1G', N'', CAST(N'2025-06-07T21:27:31.180' AS DateTime), NULL, CAST(N'2025-06-07T22:27:35.727' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (35, N'tatyana', N'$2a$10$/IKKwX8UgfoZWlDzaam1Y.3ATAZW4oaxH4xut70Ejx8ztar5fsp.q', N'', CAST(N'2025-06-08T12:14:50.757' AS DateTime), NULL, CAST(N'2025-06-08T13:14:58.163' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (46, N'braianrossiprueba1', N'$2a$10$pVWNGDpiO2BWIcb6vW62z.EFLBXKAnRLmcFRCRqL3V4KZJ3K/s2Rq', N'', CAST(N'2025-06-08T15:12:57.367' AS DateTime), NULL, CAST(N'2025-06-08T16:28:10.827' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (48, N'braianprueba2', N'$2a$10$g17bTvVkABMAz6jTlVT77.DAbOQwbtg5JggAwtRRd040mgufGspua', N'', CAST(N'2025-06-08T15:33:35.143' AS DateTime), NULL, CAST(N'2025-06-08T18:46:39.247' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (49, N'braianpruebaexito2', N'$2a$10$Kn0jrzloM1.FIK2t0WB1bOI8DtbdzrbpgsasB6O/PheupFAceYrS.', N'', CAST(N'2025-06-08T15:40:31.407' AS DateTime), NULL, CAST(N'2025-06-08T16:43:09.240' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (50, N'braian', N'$2a$10$32BADKvrVoK71NyXmGW81eWo0oBfvcvz.TK/vbrxgtEYWq61AY.Ju', N'', CAST(N'2025-06-08T18:09:16.993' AS DateTime), NULL, CAST(N'2025-06-08T19:09:25.727' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (51, N'braianrossi2024', N'$2a$10$MqjFO4BzGQumx/57rXZD.eP4BIxf9bIVxdct99pQml6rcrkIAr2sq', N'', CAST(N'2025-06-08T22:57:47.900' AS DateTime), NULL, CAST(N'2025-06-09T00:38:52.033' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (53, N'tester', N'$2a$10$zQeiaEgHV105lpeMjzxWn.NMehMZoNEQ4jFkuBUEO1RHSs0Un4XVe', N'', CAST(N'2025-06-09T03:32:16.827' AS DateTime), NULL, CAST(N'2025-06-09T05:14:52.657' AS DateTime), NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (54, N'osito', N'$2a$10$VYKP7yG3eCM3QdjBX3nE4.ACskpaDFVGwBqqUic4R44GxbAIBT.Aa', N'', CAST(N'2025-06-09T03:54:43.183' AS DateTime), NULL, CAST(N'2025-06-09T05:40:24.730' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (55, N'matecito', N'$2a$10$Po5HV/D2H45/KLv1ro33huigNkbiOjdDG.gLO10GpfZSRVj6qZHbq', N'', CAST(N'2025-06-09T04:40:59.323' AS DateTime), NULL, CAST(N'2025-06-09T05:41:05.310' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (56, N'maxiharina', N'$2a$10$UWPfbNRblLBpBAr/8FJ6POe5X5h5Qms7HGLD2j2U/qYldFoAV3HX.', N'', CAST(N'2025-06-09T18:14:32.370' AS DateTime), NULL, CAST(N'2025-06-09T19:14:41.073' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (57, N'brizu', N'$2a$10$fDyzEnNRgrXIHeiyhbfyVOUyMKKvAgXYd5AGBAAnaEkXz3MH/LWcq', N'', CAST(N'2025-06-09T22:17:59.640' AS DateTime), NULL, CAST(N'2025-07-01T00:45:48.583' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (58, N'milanesa', N'$2a$10$2TDfZHNh/tIG9T/XSfL7nO2.EPyyQorRU.5oXloPw92NQVXLlUULe', N'', CAST(N'2025-06-10T15:47:02.107' AS DateTime), NULL, CAST(N'2025-06-10T16:47:08.930' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (59, N'andresote', N'$2a$10$mYiAZNBLTUfjFYUd3V1rBe3nBCIkPXG1Q1t0ojmbbJGu1RnTwlwFi', N'', CAST(N'2025-06-10T18:35:15.330' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (61, N'santorito', N'$2a$10$bjvw13jupv3aZPYi.uhhOO.8TxLX49wFj3tJwRhZ.ByBmjSNs2fVS', N'', CAST(N'2025-06-10T18:48:23.883' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (62, N'brizu1', N'$2a$10$rNBwG9pD8y73Vr2a.O1fzu4EBk0RgZovxM5Z2AVofS0l.6nW4Z3LW', N'', CAST(N'2025-06-10T19:14:35.953' AS DateTime), NULL, CAST(N'2025-07-01T15:14:56.810' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1062, N'tecladomecanico', N'$2a$10$0oGDZwfomQffzkcDwzvLc.uGvNtQ7dT87zmLXfOhtXs645nq923dG', N'', CAST(N'2025-06-22T18:46:56.240' AS DateTime), NULL, CAST(N'2025-06-22T19:47:06.480' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1063, N'bar', N'$2a$10$slzpxMdbxRzIdlAz/uOPheEpa5eN7nxVwFVGbS2wH4422Pj3PgFqm', N'', CAST(N'2025-06-22T22:06:12.030' AS DateTime), NULL, CAST(N'2025-07-01T00:44:32.950' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1064, N'Pruebita', NULL, NULL, CAST(N'2025-06-23T02:54:12.873' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1065, N'andriancito', N'$2a$10$2T.tpwVvAr.2KHHhnl9j4.HbB.MvPJZ/z97Bxo9f3YOkQq.Aw1qNK', N'avatar', CAST(N'2025-06-23T03:02:45.930' AS DateTime), NULL, CAST(N'2025-06-23T04:04:17.733' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1066, N'ramiro', N'$2a$10$4SJ9QOmWFb7EFYLsOJgqnOQlKtXutsUPws8Nc7P8BVDmOTpb66Kj6', N'avatar', CAST(N'2025-06-23T03:18:43.043' AS DateTime), NULL, CAST(N'2025-06-24T12:57:17.013' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1067, N'ramirooooo', N'$2a$10$AlyzTrIQj5ud9yMwZ5nw.OZaq2cqzFOgVgvz/Li0IiiA9lD.KSFoe', N'avatar', CAST(N'2025-06-24T11:56:54.257' AS DateTime), NULL, CAST(N'2025-06-27T04:55:38.370' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1068, N'Pruebita2', NULL, NULL, CAST(N'2025-06-24T11:57:36.200' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1070, N'LaMejorDeTodas(TAMI)', NULL, NULL, CAST(N'2025-06-27T03:55:03.200' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1071, N'Jorge', NULL, NULL, CAST(N'2025-06-28T01:27:09.040' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1072, N'Andresita', NULL, NULL, CAST(N'2025-06-28T01:28:42.933' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1073, N'jorgeelcurioso', N'$2a$10$s9y1k.bP6CDogPA17qzWHOZgtuJrppU0WkVBHjhYrIuI5h8HVLFJy', N'avatar', CAST(N'2025-06-28T01:30:04.513' AS DateTime), NULL, CAST(N'2025-06-28T02:30:27.273' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1074, N'orozco', N'$2a$10$1f8NB6Ckuk0JAdaHotvhKuKHTUkpbQE/er6PVviI65p2CPuDYlwH6', N'', CAST(N'2025-06-28T08:38:20.280' AS DateTime), NULL, CAST(N'2025-06-30T17:58:33.437' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1075, N'pepito', N'$2a$10$CScH4Qcb1sZpXie4GUJxc.LwCOyyFZA1uoP5Ezdp6h7mbEYZiaHjm', N'', CAST(N'2025-06-29T00:21:07.923' AS DateTime), NULL, CAST(N'2025-06-29T01:57:16.830' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1076, N'elrey', N'$2a$10$ySGN2cloTxYA2UrmbFJ6iO1tJwD3VWXMIrax31OzpGwzlfC23mdVu', N'', CAST(N'2025-06-29T00:27:51.467' AS DateTime), NULL, CAST(N'2025-06-29T01:28:01.223' AS DateTime), 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1077, N'andesillo', N'$2a$10$tpJ4PKREfromuF2/ciUVuO1XUI7cwYjoNlDJKRH/vqJ2Cy.V4A3Ae', N'', CAST(N'2025-06-29T14:09:03.040' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[PLAYERS] ([player_id], [player_user], [pass_hash], [avatar], [created_at], [updated_at], [last_login], [player_type_id]) VALUES (1078, N'andresbelgrano', N'$2a$10$lCmKIee2WwrsBzOfn2CM/ugLitY85QIBtU4bWJzp7cCp8hEW9FGjC', N'', CAST(N'2025-06-29T14:10:29.117' AS DateTime), NULL, CAST(N'2025-06-29T15:10:42.910' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PLAYERS] OFF
GO
SET IDENTITY_INSERT [dbo].[TYPE_DEAL] ON 

INSERT [dbo].[TYPE_DEAL] ([deal_type_id], [deal_type_detail]) VALUES (1, N'Tregua')
INSERT [dbo].[TYPE_DEAL] ([deal_type_id], [deal_type_detail]) VALUES (2, N'No atacar')
INSERT [dbo].[TYPE_DEAL] ([deal_type_id], [deal_type_detail]) VALUES (3, N'No atacar mundial')
INSERT [dbo].[TYPE_DEAL] ([deal_type_id], [deal_type_detail]) VALUES (4, N'Intercambio de cartas')
INSERT [dbo].[TYPE_DEAL] ([deal_type_id], [deal_type_detail]) VALUES (5, N'Zona internacional')
SET IDENTITY_INSERT [dbo].[TYPE_DEAL] OFF
GO
/****** Object:  Index [UK_fwu3nn71ntbe60oxmf2t2hv19]    Script Date: 2/7/2025 00:56:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_fwu3nn71ntbe60oxmf2t2hv19] ON [dbo].[COUNTRY_CARDS]
(
	[country_id] ASC
)
WHERE ([country_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKd6gbgt0w9lnf1tpi9qwovjwub]    Script Date: 2/7/2025 00:56:44 ******/
ALTER TABLE [dbo].[PLAYERS] ADD  CONSTRAINT [UKd6gbgt0w9lnf1tpi9qwovjwub] UNIQUE NONCLUSTERED 
(
	[player_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COUNTRY] ADD  DEFAULT ((1)) FOR [base_armies]
GO
ALTER TABLE [dbo].[GAMES] ADD  CONSTRAINT [DF_GAMES_game_date]  DEFAULT (getdate()) FOR [game_date]
GO
ALTER TABLE [dbo].[PLAYERS] ADD  CONSTRAINT [DF_PLAYERS_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CARDS]  WITH CHECK ADD FOREIGN KEY([card_type_id])
REFERENCES [dbo].[CARDS_TYPES] ([card_type_id])
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD FOREIGN KEY([continent_id])
REFERENCES [dbo].[CONTINENT] ([continent_id])
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD  CONSTRAINT [FKpymfsgrl32dy3gtl9r7rykkjg] FOREIGN KEY([continent_id])
REFERENCES [dbo].[CONTINENT] ([continent_id])
GO
ALTER TABLE [dbo].[COUNTRY] CHECK CONSTRAINT [FKpymfsgrl32dy3gtl9r7rykkjg]
GO
ALTER TABLE [dbo].[COUNTRY_BORDER]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([country_id])
GO
ALTER TABLE [dbo].[COUNTRY_BORDER]  WITH CHECK ADD FOREIGN KEY([neighbor_id])
REFERENCES [dbo].[COUNTRY] ([country_id])
GO
ALTER TABLE [dbo].[COUNTRY_BORDER]  WITH CHECK ADD  CONSTRAINT [FKi3dn3lnj2x7wo4ah9lmbs0x35] FOREIGN KEY([neighbor_id])
REFERENCES [dbo].[COUNTRY] ([country_id])
GO
ALTER TABLE [dbo].[COUNTRY_BORDER] CHECK CONSTRAINT [FKi3dn3lnj2x7wo4ah9lmbs0x35]
GO
ALTER TABLE [dbo].[COUNTRY_BORDER]  WITH CHECK ADD  CONSTRAINT [FKotejen5cqgvuhu16xdvkafkk5] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([country_id])
GO
ALTER TABLE [dbo].[COUNTRY_BORDER] CHECK CONSTRAINT [FKotejen5cqgvuhu16xdvkafkk5]
GO
ALTER TABLE [dbo].[COUNTRY_CARDS]  WITH CHECK ADD FOREIGN KEY([card_id])
REFERENCES [dbo].[CARDS] ([card_id])
GO
ALTER TABLE [dbo].[COUNTRY_CARDS]  WITH CHECK ADD FOREIGN KEY([game_id])
REFERENCES [dbo].[GAMES] ([game_id])
GO
ALTER TABLE [dbo].[COUNTRY_CARDS]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CARDS_COUNTRY] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([country_id])
GO
ALTER TABLE [dbo].[COUNTRY_CARDS] CHECK CONSTRAINT [FK_COUNTRY_CARDS_COUNTRY]
GO
ALTER TABLE [dbo].[COUNTRY_CARDS]  WITH CHECK ADD  CONSTRAINT [FK38q04347sqwu21d03obpfk369] FOREIGN KEY([card_id])
REFERENCES [dbo].[CARDS] ([card_id])
GO
ALTER TABLE [dbo].[COUNTRY_CARDS] CHECK CONSTRAINT [FK38q04347sqwu21d03obpfk369]
GO
ALTER TABLE [dbo].[COUNTRY_CARDS]  WITH CHECK ADD  CONSTRAINT [FK41fkpeg8htmviqtsraarn571t] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([country_id])
GO
ALTER TABLE [dbo].[COUNTRY_CARDS] CHECK CONSTRAINT [FK41fkpeg8htmviqtsraarn571t]
GO
ALTER TABLE [dbo].[COUNTRY_CARDS]  WITH CHECK ADD  CONSTRAINT [FKqenx4uehrotefovgvgnmx2d6t] FOREIGN KEY([game_id])
REFERENCES [dbo].[GAMES] ([game_id])
GO
ALTER TABLE [dbo].[COUNTRY_CARDS] CHECK CONSTRAINT [FKqenx4uehrotefovgvgnmx2d6t]
GO
ALTER TABLE [dbo].[DEAL]  WITH CHECK ADD FOREIGN KEY([deal_type_id])
REFERENCES [dbo].[TYPE_DEAL] ([deal_type_id])
GO
ALTER TABLE [dbo].[DEAL]  WITH CHECK ADD  CONSTRAINT [FK_DEAL_GAME] FOREIGN KEY([game_id])
REFERENCES [dbo].[GAMES] ([game_id])
GO
ALTER TABLE [dbo].[DEAL] CHECK CONSTRAINT [FK_DEAL_GAME]
GO
ALTER TABLE [dbo].[DEAL_PLAYERS]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[DEAL] ([deal_id])
GO
ALTER TABLE [dbo].[DEAL_PLAYERS]  WITH CHECK ADD  CONSTRAINT [FK_DEAL_PLAYERS_GAME_PLAYER] FOREIGN KEY([game_player_id])
REFERENCES [dbo].[GAME_PLAYERS] ([games_players_id])
GO
ALTER TABLE [dbo].[DEAL_PLAYERS] CHECK CONSTRAINT [FK_DEAL_PLAYERS_GAME_PLAYER]
GO
ALTER TABLE [dbo].[DEAL_PLAYERS]  WITH CHECK ADD  CONSTRAINT [FK9lc26q4ro42ule2sae497mhpu] FOREIGN KEY([game_player_id])
REFERENCES [dbo].[GAME_PLAYERS] ([games_players_id])
GO
ALTER TABLE [dbo].[DEAL_PLAYERS] CHECK CONSTRAINT [FK9lc26q4ro42ule2sae497mhpu]
GO
ALTER TABLE [dbo].[GAME_PLAYERS]  WITH CHECK ADD FOREIGN KEY([game_id])
REFERENCES [dbo].[GAMES] ([game_id])
GO
ALTER TABLE [dbo].[GAME_PLAYERS]  WITH CHECK ADD FOREIGN KEY([player_id])
REFERENCES [dbo].[PLAYERS] ([player_id])
GO
ALTER TABLE [dbo].[GAME_PLAYERS]  WITH CHECK ADD  CONSTRAINT [FK_GAME_PLAYERS_COLOR] FOREIGN KEY([color_id])
REFERENCES [dbo].[COLORS] ([color_id])
GO
ALTER TABLE [dbo].[GAME_PLAYERS] CHECK CONSTRAINT [FK_GAME_PLAYERS_COLOR]
GO
ALTER TABLE [dbo].[GAME_PLAYERS]  WITH CHECK ADD  CONSTRAINT [FKj2g4oegekk58ag3xu512s25c6] FOREIGN KEY([color_id])
REFERENCES [dbo].[COLORS] ([color_id])
GO
ALTER TABLE [dbo].[GAME_PLAYERS] CHECK CONSTRAINT [FKj2g4oegekk58ag3xu512s25c6]
GO
ALTER TABLE [dbo].[GAME_PLAYERS]  WITH CHECK ADD  CONSTRAINT [FKjltki2cjqrxb27qnpe0bb36v6] FOREIGN KEY([player_id])
REFERENCES [dbo].[PLAYERS] ([player_id])
GO
ALTER TABLE [dbo].[GAME_PLAYERS] CHECK CONSTRAINT [FKjltki2cjqrxb27qnpe0bb36v6]
GO
ALTER TABLE [dbo].[GAME_PLAYERS]  WITH CHECK ADD  CONSTRAINT [FKrbr2flqdav5ovyjas7q92u64r] FOREIGN KEY([game_id])
REFERENCES [dbo].[GAMES] ([game_id])
GO
ALTER TABLE [dbo].[GAME_PLAYERS] CHECK CONSTRAINT [FKrbr2flqdav5ovyjas7q92u64r]
GO
ALTER TABLE [dbo].[GAMES]  WITH CHECK ADD FOREIGN KEY([created_by_player_id])
REFERENCES [dbo].[PLAYERS] ([player_id])
GO
ALTER TABLE [dbo].[GAMES]  WITH CHECK ADD FOREIGN KEY([current_turn_player_id])
REFERENCES [dbo].[PLAYERS] ([player_id])
GO
ALTER TABLE [dbo].[GAMES]  WITH CHECK ADD  CONSTRAINT [FK3h0ruke1gj25y6qj9ut6jekwj] FOREIGN KEY([current_turn_player_id])
REFERENCES [dbo].[PLAYERS] ([player_id])
GO
ALTER TABLE [dbo].[GAMES] CHECK CONSTRAINT [FK3h0ruke1gj25y6qj9ut6jekwj]
GO
ALTER TABLE [dbo].[GAMES]  WITH CHECK ADD  CONSTRAINT [FKhn5fjbcmy48hv2oqy6d8vq2ap] FOREIGN KEY([created_by_player_id])
REFERENCES [dbo].[PLAYERS] ([player_id])
GO
ALTER TABLE [dbo].[GAMES] CHECK CONSTRAINT [FKhn5fjbcmy48hv2oqy6d8vq2ap]
GO
ALTER TABLE [dbo].[OBJETIVE_CARDS]  WITH CHECK ADD FOREIGN KEY([card_id])
REFERENCES [dbo].[CARDS] ([card_id])
GO
ALTER TABLE [dbo].[OBJETIVE_CARDS]  WITH CHECK ADD FOREIGN KEY([game_id])
REFERENCES [dbo].[GAMES] ([game_id])
GO
ALTER TABLE [dbo].[OBJETIVE_CARDS]  WITH CHECK ADD FOREIGN KEY([game_player_id])
REFERENCES [dbo].[GAME_PLAYERS] ([games_players_id])
GO
ALTER TABLE [dbo].[PLAYERS]  WITH CHECK ADD FOREIGN KEY([player_type_id])
REFERENCES [dbo].[PLAYER_TYPES] ([player_type_id])
GO
ALTER TABLE [dbo].[PLAYERS]  WITH CHECK ADD  CONSTRAINT [FKe5hofag09dd5gdrj3nseca753] FOREIGN KEY([player_type_id])
REFERENCES [dbo].[PLAYER_TYPES] ([player_type_id])
GO
ALTER TABLE [dbo].[PLAYERS] CHECK CONSTRAINT [FKe5hofag09dd5gdrj3nseca753]
GO
USE [master]
GO
ALTER DATABASE [TEG_LOCAL] SET  READ_WRITE 
GO

CREATE LOGIN TPI 
WITH PASSWORD = 'trabajopractico1';
GO

-- Cambiar al contexto de tu base de datos
USE TEG_LOCAL;
GO

-- Crear usuario dentro de la base de datos y asignarlo al login
CREATE USER andresveron 
FOR LOGIN TPI;
GO

-- Darle permisos (puede ser db_owner si es para desarrollo)
ALTER ROLE db_owner ADD MEMBER andresveron;
GO
