USE [project]
GO
/****** Object:  StoredProcedure [dbo].[FindUniqueRolePermission]    Script Date: 12/28/2024 2:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindUniqueRolePermission]
    @role_id INT,
    @permission_id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Query for finding a unique role_permission based on role_id and permission_id
    SELECT TOP 1 *
    FROM [dbo].[role_permissions]
    WHERE [role_id] = @role_id
      AND [permission_id] = @permission_id
END;



GO
