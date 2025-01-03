USE [project]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 12/29/2024 4:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser]
@username NVARCHAR(255) = NULL, -- NULL for social login users
@email NVARCHAR(255),
@password NVARCHAR(MAX) = NULL, -- NULL for social login users
@access_token NVARCHAR(MAX) = NULL,
@refresh_token NVARCHAR(MAX) = NULL,
@role_name VARCHAR(255) = 'USER',
@avatar NVARCHAR(MAX) =NULL,
@full_name NVARCHAR(255) = NULL,
@phone_number NVARCHAR(50) = NULL,
@address NVARCHAR(MAX) = NULL,
@provider VARCHAR(255) = NULL, -- NULL for local users
@provider_id VARCHAR(255) = NULL ,-- Unique ID from provider (NULL for local users)
@is_email_verified BIT = 0
AS
BEGIN
	DECLARE @role_id int
	IF (SELECT COUNT(id) FROM roles WHERE name = @role_name) > 0
	BEGIN
		SELECT @role_id = id FROM roles WHERE name = @role_name;
    	INSERT INTO Users (username,email,password,access_token,refresh_token,role_id,avatar,full_name,phone_number,address,provider,provider_id,is_email_verified)
    	VALUES (@username,@email,@password,@access_token,@refresh_token,@role_id,@avatar,@full_name,@phone_number,@address,@provider,@provider_id,@is_email_verified);
	END
	ELSE
	BEGIN
		INSERT INTO roles(name) VALUES (@role_name)
		SELECT @role_id = id FROM roles WHERE name = @role_name;
		INSERT INTO Users (username,email,password,access_token,refresh_token,role_id,avatar,full_name,phone_number,address,provider,provider_id,is_email_verified)
    	VALUES (@username,@email,@password,@access_token,@refresh_token,@role_id,@avatar,@full_name,@phone_number,@address,@provider,@provider_id,@is_email_verified);
	END
	
    -- Return the newly created user (similar to Prisma returning the created object)
    SELECT 
        *
    FROM 
        Users
    WHERE 
        email = @email;
END;


GO
