USE [master]
GO
/****** Object:  Database [FBK74-official]    Script Date: 3/10/2024 1:28:06 PM ******/
CREATE DATABASE [FBK74-official]

USE [FBK74-official]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/10/2024 1:28:06 PM ******/

GO
CREATE TABLE [dbo].[Account](
	[IDAccount] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[PassWord] [nvarchar](100) NULL,
	[Gender] [int] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[IDEmail] [nvarchar](50) NULL,
	[IDFacebook] [nvarchar](50) NULL,
	[Bank] [nvarchar](50) NULL,
	[BankNumber] [nvarchar](20) NULL,
	[Role] [int] NULL,
	[Status] [int] NULL,
	[Dob] [date] NULL,
 CONSTRAINT [PK__Account__1D323F909FD907DE] PRIMARY KEY CLUSTERED 
(
	[IDAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[IDBill] [int] IDENTITY(1,1) NOT NULL,
	[Invoice] [nvarchar](50) NULL,
	[IDRegisteredFootballField] [int] NULL,
	[IDRegistFindOppoent] [int] NULL,
	[IDAccount2] [int] NULL,
	[IDStudySchedule] [int] NULL,
	[IDScheduleTournament] [int] NULL,
	[PaymentDate] [smalldatetime] NULL,
 CONSTRAINT [PK__Bill__23BDC1E61B4EB3DC] PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[IDClass] [int] NOT NULL,
	[IDYouthTrainingCourse] [int] NULL,
	[CoachName] [nvarchar](100) NULL,
	[CoachPhoneNumber] [nvarchar](20) NULL,
	[NumberOfStudent] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FootballField]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FootballField](
	[IDFootballField] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TypeofFootballField] [int] NULL,
	[Price] [money] NULL,
	[Image] [nvarchar](100) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Football__B277A961042831E2] PRIMARY KEY CLUSTERED 
(
	[IDFootballField] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FootballFieldSchedule]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FootballFieldSchedule](
	[IDFootballFieldSchedule] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NULL,
	[Endtime] [time](7) NULL,
	[IDFootballField] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Football__DD912D1323B5839D] PRIMARY KEY CLUSTERED 
(
	[IDFootballFieldSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberOfClass]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberOfClass](
	[IDMemberOfClass] [int] IDENTITY(1,1) NOT NULL,
	[IDAccount] [int] NULL,
	[IDClass] [int] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[NameStudent] [nvarchar](50) NULL,
	[age] [int] NULL,
	[height] [int] NULL,
	[weight] [int] NULL,
	[status1] [int] NULL,
 CONSTRAINT [PK__MemberOf__9EEAA9B7CF31E821] PRIMARY KEY CLUSTERED 
(
	[IDMemberOfClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDProduct] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[image] [varchar](max) NULL,
	[quantity] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Product__3213E83FD049BE35] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[IDProductDetail] [int] IDENTITY(1,1) NOT NULL,
	[IDProduct] [int] NULL,
	[Quantity] [int] NULL,
	[IDBill] [int] NULL,
 CONSTRAINT [PK__ProductD__D7B029C07D851A60] PRIMARY KEY CLUSTERED 
(
	[IDProductDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisteredFootballField]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredFootballField](
	[IDRegisteredFootballField] [int] IDENTITY(1,1) NOT NULL,
	[IDAccount1] [int] NULL,
	[IDAccount2] [int] NULL,
	[IDRegistFindOppoent] [int] NULL,
	[IDFootballFieldSchedule] [int] NULL,
	[Date] [date] NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Deposit] [money] NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](200) NULL,
 CONSTRAINT [PK__Register__DD0496C725435013] PRIMARY KEY CLUSTERED 
(
	[IDRegisteredFootballField] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistFindOpponent]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistFindOpponent](
	[IDRegistFindOppoent] [int] IDENTITY(1,1) NOT NULL,
	[IDAccount1] [int] NULL,
	[IDAccount2] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[TimeStart] [time](7) NULL,
	[TimeEnd] [time](7) NULL,
	[Date] [date] NULL,
	[Power] [nvarchar](100) NULL,
	[TypeOfFootballField] [int] NULL,
	[Deposit] [money] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__RegistFi__16B430F072E89BF5] PRIMARY KEY CLUSTERED 
(
	[IDRegistFindOppoent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleTournament]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleTournament](
	[IDScheduleTournament] [int] IDENTITY(1,1) NOT NULL,
	[IDFootballFieldSchedule] [int] NULL,
	[Date] [datetime] NULL,
	[IDTeam1] [int] NULL,
	[IDTeam2] [int] NULL,
	[Result] [nvarchar](50) NULL,
	[TournamentID] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK__Schedule__F03B2424A43861D6] PRIMARY KEY CLUSTERED 
(
	[IDScheduleTournament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudySchedule]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudySchedule](
	[IDStudySchedule] [int] IDENTITY(1,1) NOT NULL,
	[IDClass] [int] NULL,
	[IDFootballFieldSchedule] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK__StudySch__321AAAC7109BB2F6] PRIMARY KEY CLUSTERED 
(
	[IDStudySchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[IDTeam] [int] IDENTITY(1,1) NOT NULL,
	[IDAccount1] [int] NULL,
	[IDTournament] [int] NULL,
	[TeamName] [nvarchar](100) NULL,
	[TeamDetail] [nvarchar](200) NULL,
	[Status] [nvarchar](5) NULL,
 CONSTRAINT [PK__Team__B1AB4A7BA3F6CB21] PRIMARY KEY CLUSTERED 
(
	[IDTeam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[IDTeamMembers] [int] IDENTITY(1,1) NOT NULL,
	[IDTeam] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[JerseyNumber] [int] NULL,
	[IsCaption] [bit] NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK__TeamMemb__3D00DD36C9F106D4] PRIMARY KEY CLUSTERED 
(
	[IDTeamMembers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournament](
	[IDTournament] [int] IDENTITY(1,1) NOT NULL,
	[TimeRegist] [date] NULL,
	[TimeCloseRegist] [date] NULL,
	[TimeStart] [date] NULL,
	[NumberTeamRegist] [int] NULL,
	[Information] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Award] [money] NULL,
	[TimeEnd] [date] NULL,
	[Status] [nchar](10) NULL,
 CONSTRAINT [PK__Tourname__85F2FED638D75C48] PRIMARY KEY CLUSTERED 
(
	[IDTournament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentResults]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentResults](
	[IDTournamentResults] [int] IDENTITY(1,1) NOT NULL,
	[IDTournament] [int] NULL,
	[Rating] [int] NULL,
	[IDTeamWin] [int] NULL,
 CONSTRAINT [PK__Tourname__BFC28224381F53CE] PRIMARY KEY CLUSTERED 
(
	[IDTournamentResults] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YouthTrainingCourse]    Script Date: 3/10/2024 1:28:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YouthTrainingCourse](
	[IDYouthTrainingCourse] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[NameYouthTrainingCourse] [nvarchar](1000) NULL,
	[TimeRegist] [date] NULL,
	[TimeCloseRegist] [date] NULL,
	[TimeStart] [date] NULL,
	[Tuition] [money] NULL,
	[Information] [nvarchar](1000) NULL,
 CONSTRAINT [PK__YouthTra__BEAA5EABB173DEEA] PRIMARY KEY CLUSTERED 
(
	[IDYouthTrainingCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([IDAccount], [Name], [UserName], [PassWord], [Gender], [PhoneNumber], [IDEmail], [IDFacebook], [Bank], [BankNumber], [Role], [Status], [Dob]) VALUES (1, N'nam', N'1231', N'1321', 1, N'012345678', NULL, NULL, N'', NULL, 1, 0, NULL)
INSERT [dbo].[Account] ([IDAccount], [Name], [UserName], [PassWord], [Gender], [PhoneNumber], [IDEmail], [IDFacebook], [Bank], [BankNumber], [Role], [Status], [Dob]) VALUES (2, N'Nhat', N'123', N'123', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[FootballField] ON 

INSERT [dbo].[FootballField] ([IDFootballField], [Name], [TypeofFootballField], [Price], [Image], [Status]) VALUES (1, N'Field1', 1, 1.0000, N'1', 1)
SET IDENTITY_INSERT [dbo].[FootballField] OFF
GO
SET IDENTITY_INSERT [dbo].[ScheduleTournament] ON 

INSERT [dbo].[ScheduleTournament] ([IDScheduleTournament], [IDFootballFieldSchedule], [Date], [IDTeam1], [IDTeam2], [Result], [TournamentID], [Description]) VALUES (1, 1, CAST(N'2024-03-11T10:30:00.000' AS DateTime), 1, 3, N'6-0', 1, N'saaaa edit')
INSERT [dbo].[ScheduleTournament] ([IDScheduleTournament], [IDFootballFieldSchedule], [Date], [IDTeam1], [IDTeam2], [Result], [TournamentID], [Description]) VALUES (3, 1, CAST(N'2024-03-16T12:58:00.000' AS DateTime), 7, 6, N'11-0', 1, N'hehe')
SET IDENTITY_INSERT [dbo].[ScheduleTournament] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (1, 1, 1, N'MU Edit', N'0930930930', N'1')
INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (2, 1, 2, N'MU', N'0930930930', N'1')
INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (3, 1, 1, N'MU 2', N'0933071004', N'1')
INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (4, 1, 1, N'MU delete', N'0933071004', N'0')
INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (5, 1, 5, N'test nikke', N'0933071104', N'0')
INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (6, 2, 1, N'Juventus', N'0933071004', N'1')
INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (7, 2, 1, N'Dấu', N'0930930930', N'1')
INSERT [dbo].[Team] ([IDTeam], [IDAccount1], [IDTournament], [TeamName], [TeamDetail], [Status]) VALUES (8, NULL, 1, N'RealEdit', N'0933071004', N'1')
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[TeamMembers] ON 

INSERT [dbo].[TeamMembers] ([IDTeamMembers], [IDTeam], [Name], [PhoneNumber], [JerseyNumber], [IsCaption], [Detail]) VALUES (2, 1, N'Cuong Edit', N'0977095128', 10, NULL, N'Hehe Edittttt')
INSERT [dbo].[TeamMembers] ([IDTeamMembers], [IDTeam], [Name], [PhoneNumber], [JerseyNumber], [IsCaption], [Detail]) VALUES (12, 1, N'Customer', N'09090909', 11, NULL, N'asjajsEdit')
SET IDENTITY_INSERT [dbo].[TeamMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournament] ON 

INSERT [dbo].[Tournament] ([IDTournament], [TimeRegist], [TimeCloseRegist], [TimeStart], [NumberTeamRegist], [Information], [Image], [Name], [Award], [TimeEnd], [Status]) VALUES (1, CAST(N'2024-01-04' AS Date), CAST(N'2024-03-05' AS Date), CAST(N'2024-03-09' AS Date), 11, N'Lỗi', N'https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Bundesliga_logo_%282017%29.svg/1200px-Bundesliga_logo_%282017%29.svg.png', N'Tiểu Cường edit', 100001.0000, CAST(N'2024-11-26' AS Date), N'1         ')
INSERT [dbo].[Tournament] ([IDTournament], [TimeRegist], [TimeCloseRegist], [TimeStart], [NumberTeamRegist], [Information], [Image], [Name], [Award], [TimeEnd], [Status]) VALUES (2, CAST(N'2024-01-03' AS Date), CAST(N'2024-11-04' AS Date), CAST(N'2023-01-01' AS Date), 10, N'Giải đấu ông bà già', N'https://s.yimg.com/os/creatr-uploaded-images/2023-06/c3acb370-03a0-11ee-8957-525d7f4643f9', N'FPT tiểu học', 1500000.0000, NULL, N'1         ')
INSERT [dbo].[Tournament] ([IDTournament], [TimeRegist], [TimeCloseRegist], [TimeStart], [NumberTeamRegist], [Information], [Image], [Name], [Award], [TimeEnd], [Status]) VALUES (3, CAST(N'2024-01-03' AS Date), CAST(N'2024-11-04' AS Date), CAST(N'2024-03-09' AS Date), 13, N'đây là giải đấu bóng đá ....', N'https://i.pinimg.com/originals/85/9e/09/859e09d484ef4e43c522052682db0550.jpg', N'EPL', 1200000.0000, NULL, N'1         ')
INSERT [dbo].[Tournament] ([IDTournament], [TimeRegist], [TimeCloseRegist], [TimeStart], [NumberTeamRegist], [Information], [Image], [Name], [Award], [TimeEnd], [Status]) VALUES (5, CAST(N'2024-03-07' AS Date), CAST(N'2024-03-11' AS Date), CAST(N'2024-03-12' AS Date), NULL, N'sa', N'nike_wallpaper.jpg', N'Nike', 0.0000, CAST(N'2024-03-20' AS Date), N'0         ')
SET IDENTITY_INSERT [dbo].[Tournament] OFF
GO
USE [master]
GO
ALTER DATABASE [FBK74-official] SET  READ_WRITE 
GO
