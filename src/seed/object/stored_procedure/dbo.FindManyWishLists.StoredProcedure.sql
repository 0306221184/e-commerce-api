USE [project]
GO
/****** Object:  StoredProcedure [dbo].[FindManyWishLists]    Script Date: 12/29/2024 4:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindManyWishLists]
    @user_id INT = NULL,
    @product_id INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Query for finding multiple wish list entries based on user_id and product_id
    SELECT *
    FROM [dbo].[wish_lists]
    WHERE (@user_id IS NULL OR [user_id] = @user_id)
      AND (@product_id IS NULL OR [product_id] = @product_id);
END;



GO
