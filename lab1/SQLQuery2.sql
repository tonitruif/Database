/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP (1000) [Station]
      ,[Line]
      ,[Admarea]
      ,[global_id]
      ,[District]
      ,[Status]
      ,[Id]
  FROM [Metro].[dbo].[StationsT]