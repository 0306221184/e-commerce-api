USE [project]
GO
/****** Object:  StoredProcedure [dbo].[FindManyPermissions]    Script Date: 12/28/2024 2:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindManyPermissions]
    @name NVARCHAR(255) = NULL,
    @created_at DATETIME = NULL,
    @updated_at DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Query to find multiple permissions based on the filtering parameters
    SELECT *
    FROM [dbo].[permissions]
    WHERE (@name IS NULL OR [name] LIKE '%' + @name + '%')
      AND (@created_at IS NULL OR [created_at] = @created_at)
      AND (@updated_at IS NULL OR [updated_at] = @updated_at);
END;



GO
