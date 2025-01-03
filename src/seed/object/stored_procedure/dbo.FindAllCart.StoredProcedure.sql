USE [project]
GO
/****** Object:  StoredProcedure [dbo].[FindAllCart]    Script Date: 12/29/2024 4:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindAllCart]
    @id INT = NULL,
    @user_id INT = NULL,
    @product_id INT = NULL,
    @quantity INT = NULL,
    @created_at DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Query to find all cart items with optional filters for each property
    SELECT *
    FROM [dbo].[cart]
    WHERE (@id IS NULL OR [id] = @id)
      AND (@user_id IS NULL OR [user_id] = @user_id)
      AND (@product_id IS NULL OR [product_id] = @product_id)
      AND (@quantity IS NULL OR [quantity] = @quantity)
      AND (@created_at IS NULL OR [created_at] = @created_at);
END;



GO
