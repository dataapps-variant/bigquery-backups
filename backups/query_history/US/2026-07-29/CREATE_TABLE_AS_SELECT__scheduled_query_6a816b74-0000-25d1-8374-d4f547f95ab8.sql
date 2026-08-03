-- job_id: scheduled_query_6a816b74-0000-25d1-8374-d4f547f95ab8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T08:20:03.693000+00:00
-- started: 2026-07-29T08:20:03.982000+00:00
-- ended: 2026-07-29T08:20:05.468000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.CPA_By_Entity_MTD` AS

WITH daily_aggregated AS (
  -- First aggregate by Date and Entity (same as CPA_By_Entity)
  SELECT 
    Date,
    Entity,
    -- Entity Name mapping
    CASE Entity
      WHEN 'AT' THEN 'ATH Digital LLC'
      WHEN 'CT' THEN 'Character Types LLC'
      WHEN 'FS' THEN 'Formsource LLC'
      WHEN 'JF' THEN 'Job Flow LLC'
      WHEN 'CN' THEN 'Contracts Dot Net LLC'
      WHEN 'PD' THEN 'pdf Dot Net LLC'
      WHEN 'VG' THEN 'Total'
      ELSE Entity
    END AS Entity_Name,
    SUM(Daily_Spend) AS Daily_Spend,
    SUM(Daily_Total_Users) AS Daily_Total_Users,
    SUM(Daily_SS_Users) AS Daily_SS_Users,
    SUM(Daily_New_Regular_Users) AS Daily_New_Regular_Users,
    SUM(Daily_Subscriptions) AS Daily_Subscriptions
  FROM `variant-finance-data-project.Daedalus.CAC_By_Entity`
  GROUP BY Date, Entity
)

SELECT 
  Date,
  Entity,
  Entity_Name,
  -- MTD cumulative sums (from month start to current date)
  ROUND(SUM(Daily_Spend) OVER (
    PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
    ORDER BY Date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ), 2) AS MTD_Spend,
  CAST(SUM(Daily_Total_Users) OVER (
    PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
    ORDER BY Date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS INT64) AS MTD_Total_Users,
  CAST(SUM(Daily_SS_Users) OVER (
    PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
    ORDER BY Date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS INT64) AS MTD_SS_Users,
  CAST(SUM(Daily_New_Regular_Users) OVER (
    PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
    ORDER BY Date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS INT64) AS MTD_New_Regular_Users,
  CAST(SUM(Daily_Subscriptions) OVER (
    PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
    ORDER BY Date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS INT64) AS MTD_Subscriptions,
  -- MTD CAC calculated from cumulative values
  CASE 
    WHEN SUM(Daily_New_Regular_Users) OVER (
      PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
      ORDER BY Date 
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) = 0 THEN NULL
    ELSE ROUND(
      SUM(Daily_Spend) OVER (
        PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
        ORDER BY Date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ) / NULLIF(SUM(Daily_New_Regular_Users) OVER (
        PARTITION BY Entity, DATE_TRUNC(Date, MONTH) 
        ORDER BY Date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ), 0), 2)
  END AS MTD_CAC
FROM daily_aggregated
ORDER BY Date, Entity;
