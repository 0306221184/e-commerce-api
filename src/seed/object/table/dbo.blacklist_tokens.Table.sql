USE [project]
GO
/****** Object:  Table [dbo].[blacklist_tokens]    Script Date: 12/28/2024 1:17:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blacklist_tokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
