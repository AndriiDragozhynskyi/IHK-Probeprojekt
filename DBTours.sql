USE [master]
GO
/****** Object:  Database [Tours]    Script Date: 04.07.2022 15:10:14 ******/
CREATE DATABASE [Tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tours', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tours_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tours] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tours] SET  MULTI_USER 
GO
ALTER DATABASE [Tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tours] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tours] SET QUERY_STORE = OFF
GO
USE [Tours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountofStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Imagesource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[TourID] [int] NOT NULL,
	[HotelID] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 04.07.2022 15:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourID] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AD', N'Andorra')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AE', N'United Arab Emirates ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AF', N'Afghanistan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AG', N'Antigua and Barbuda')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AI', N'Anguilla')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AL', N'Albania')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AM', N'Armenia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AO', N'Angola')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AQ', N'Antarctica')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AR', N'Argentina')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AS', N'American Samoa')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AT', N'Austria')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AU', N'Australia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AW', N'Aruba')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AX', N'Aland Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AZ', N'Azerbaijan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BA', N'Bosnia and Herzegovina')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BB', N'Barbados')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BD', N'Bangladesh')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BE', N'Belgium')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BF', N'Burkina Faso')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BG', N'Bulgaria')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BH', N'Bahrain')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BI', N'Burundi')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BJ', N'Benin')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BL', N'Saint Barthelemy')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BM', N'Bermuda')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BN', N'Brunei Darussalam')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BO', N'Bolivia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BQ', N'Bonaire')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BR', N'Brazil')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BS', N'Bahamas')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BT', N'Bhutan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BV', N'Bouvet Island')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BW', N'Botswana')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BY', N'Belarus')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BZ', N'Belize')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CA', N'Canada')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CC', N'Cocos (Keeling) Islands (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CD', N'Congo (the Democratic Republic of the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CF', N'Central African Republic (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CG', N'Congo (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CH', N'Switzerland')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CI', N'Cote d''Ivoire')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CK', N'Cook Islands (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CL', N'Chile')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CM', N'Cameroon')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CN', N'China')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CO', N'Colombia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CR', N'Costa Rica')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CU', N'Cuba')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CV', N'Cabo Verde')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CW', N'Cura?ao')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CX', N'Christmas Island')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CY', N'Cyprus')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'CZ', N'Czechia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DE', N'Germany')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DJ', N'Djibouti')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DK', N'Denmark')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DM', N'Dominica')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DO', N'Dominican Republic')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DZ', N'Algeria')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EC', N'Ecuador')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EE', N'Estonia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EG', N'Egypt')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EH', N'Western Sahara')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ER', N'Eritrea')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ES', N'Spain')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ET', N'Ethiopia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'FI', N'Finland')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'FJ', N'Fiji')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'FK', N'Falkland Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'FM', N'Micronesia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'FO', N'Faroe Islands ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'FR', N'France')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GA', N'Gabon')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GB', N'Great Britain')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GD', N'Grenada')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GE', N'Georgia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GF', N'French Guiana')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GG', N'Guernsey')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GH', N'Ghana')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GI', N'Gibraltar')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GL', N'Greenland')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GM', N'Gambia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GN', N'Guinea')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GP', N'Guadeloupe')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GQ', N'Equatorial Guinea')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GR', N'Greece')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GS', N'South Georgia and the South Sandwich Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GT', N'Guatemala')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GU', N'Guam')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GW', N'Guinea-Bissau')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GY', N'Guyana')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'HK', N'Hong Kong')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'HM', N'Heard Island and McDonald Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'HN', N'Honduras')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'HR', N'Croatia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'HT', N'Haiti')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'HU', N'Hungary')
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ID', N'Indonesia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IE', N'Ireland')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IL', N'Israel')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IM', N'Isle of Man')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IN', N'India')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IO', N'British Indian Ocean Territory (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IQ', N'Iraq')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IR', N'Iran (Islamic Republic of)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IS', N'Iceland')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IT', N'Italy')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'JE', N'Jersey')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'JM', N'Jamaica')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'JO', N'Jordan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'JP', N'Japan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KE', N'Kenya')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KG', N'Kyrgyzstan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KH', N'Cambodia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KI', N'Kiribati')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KM', N'Comoros (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KN', N'Saint Kitts and Nevis')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KP', N'Korea (the Democratic People''s Republic of)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KR', N'Korea (the Republic of)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KW', N'Kuwait')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KY', N'Cayman Islands (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'KZ', N'Kazakhstan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LA', N'Lao People''s Democratic Republic')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LB', N'Lebanon')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LC', N'Saint Lucia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LI', N'Liechtenstein')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LK', N'Sri Lanka')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LR', N'Liberia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LS', N'Lesotho')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LT', N'Lithuania')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LU', N'Luxembourg')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LV', N'Latvia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'LY', N'Libya')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MA', N'Morocco')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MC', N'Monaco')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MD', N'Moldova')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ME', N'Montenegro')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MF', N'Saint Martin (French part)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MG', N'Madagascar')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MH', N'Marshall Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MK', N'North Macedonia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ML', N'Mali')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MM', N'Myanmar')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MN', N'Mongolia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MO', N'Macao')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MP', N'Northern Mariana Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MQ', N'Martinique')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MR', N'Mauritania')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MS', N'Montserrat')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MT', N'Malta')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MU', N'Mauritius')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MV', N'Maldives')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MW', N'Malawi')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MX', N'Mexico')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MY', N'Malaysia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'MZ', N'Mozambique')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NA', N'Namibia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NC', N'New Caledonia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NE', N'Niger')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NF', N'Norfolk Island')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NG', N'Nigeria')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NI', N'Nicaragua')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NL', N'Netherlands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NO', N'Norway')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NP', N'Nepal')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NR', N'Nauru')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NU', N'Niue')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'NZ', N'New Zealand')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'OM', N'Oman')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PA', N'Panama')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PE', N'Peru')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PF', N'French Polynesia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PG', N'Papua New Guinea')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PH', N'Philippines')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PK', N'Pakistan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PL', N'Poland')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PM', N'Saint Pierre and Miquelon')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PN', N'Pitcairn')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PR', N'Puerto Rico')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PS', N'Palestine')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PT', N'Portugal')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PW', N'Palau')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'PY', N'Paraguay')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'QA', N'Qatar')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RE', N'Reunion')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RO', N'Romania')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RS', N'Serbia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RU', N'Russian Federation')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RW', N'Rwanda')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SA', N'Saudi Arabia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SB', N'Solomon Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SC', N'Seychelles')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SD', N'Sudan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SE', N'Sweden')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SG', N'Singapore')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SH', N'Saint Helena')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SI', N'Slovenia')
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SJ', N'Svalbard and Jan Mayen')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SK', N'Slovakia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SL', N'Sierra Leone')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SM', N'San Marino')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SN', N'Senegal')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SO', N'Somalia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SR', N'Suriname')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SS', N'South Sudan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ST', N'Sao Tome and Principe')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SV', N'El Salvador')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SX', N'Sint Maarten (Dutch part)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SY', N'Syrian Arab Republic')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'SZ', N'Eswatini')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TC', N'Turks and Caicos Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TD', N'Chad')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TF', N'French Southern Territories')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TG', N'Togo')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TH', N'Thailand')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TJ', N'Tajikistan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TK', N'Tokelau')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TL', N'Timor-Leste')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TM', N'Turkmenistan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TN', N'Tunisia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TO', N'Tonga')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TR', N'Turkey')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TT', N'Trinidad and Tobago')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TV', N'Tuvalu')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TW', N'Taiwan ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'TZ', N'Tanzania, the United Republic of')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'UA', N'Ukraine')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'UG', N'Uganda')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'UM', N'United States Minor Outlying Islands')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'US', N'United States of America ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'UY', N'Uruguay')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'UZ', N'Uzbekistan')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'VA', N'Holy See (the)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'VC', N'Saint Vincent and the Grenadines')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'VE', N'Venezuela ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'VG', N'Virgin Islands (British)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'VI', N'Virgin Islands (U.S.)')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'VN', N'Viet Nam')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'VU', N'Vanuatu')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'WF', N'Wallis and Futuna')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'WS', N'Samoa')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'YE', N'Yemen')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'YT', N'Mayotte')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ZA', N'South Africa')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ZM', N'Zambia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ZW', N'Zimbabwe')
GO
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (0, N'Test Hotel', 1, N'AF')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (1, N'First World Hotel & Plaza', 3, N'MY')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (2, N'CityCenter', 4, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (3, N'MGM Grand', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (4, N'Luxor Las Vegas', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (5, N'Ambassador City Jomtien', 4, N'TH')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (6, N'The Venetian Las Vegas', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (7, N'Excalibur', 3, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (8, N'Caesar Palace', 4, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (9, N'Belagio', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (10, N'Sheraton Grand Macao Hotel', 4, N'CN')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (11, N'Circus', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (12, N'Shinagawa Prince Hotel', 4, N'JP')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (13, N'Flamingo Las Vegas', 3, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (14, N'Atlantis Paradise Island', 4, N'BS')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (15, N'Hilton Hawaiian Village', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (16, N'"Mandalai Bay"', 4, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (17, N'The Palazzo', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (18, N'Disney''s Port Orleans Resort', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (19, N'The Mirage', 5, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (20, N'Monte Carlo Resort and Casino', 3, N'US')
INSERT [dbo].[Hotel] ([Id], [Name], [CountofStars], [CountryCode]) VALUES (21, N'Venezia Macao', 5, N'CN')
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (5, N'Internationaler Tourismus', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (6, N'Inlandstourismus', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (7, N'Kindertouren', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (8, N'Gesundheits- und Wellness-Touren', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (9, N'Sightseeing-Touren', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (10, N'Die Bedienung der korporativen Kunden auf Bestellung', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (11, N'Skigebiete', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (12, N'Kulturelle und historische Touren', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (13, N'Strandtouren', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country1] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country1]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel1] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel1]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel1] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel1]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel1] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel1]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour1] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour1]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour1] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour1]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type1] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type1]
GO
USE [master]
GO
ALTER DATABASE [Tours] SET  READ_WRITE 
GO
