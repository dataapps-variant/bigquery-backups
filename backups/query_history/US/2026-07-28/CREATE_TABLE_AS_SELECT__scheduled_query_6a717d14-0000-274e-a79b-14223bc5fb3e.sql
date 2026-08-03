-- job_id: scheduled_query_6a717d14-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T08:20:01.465000+00:00
-- started: 2026-07-28T08:20:01.767000+00:00
-- ended: 2026-07-28T08:20:02.675000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.CPA_By_Entity` AS

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
  -- Sum all daily metrics by Date and Entity
  ROUND(SUM(Daily_Spend), 2) AS Daily_Spend,
  CAST(SUM(Daily_Total_Users) AS INT64) AS Daily_Total_Users,
  CAST(SUM(Daily_SS_Users) AS INT64) AS Daily_SS_Users,
  CAST(SUM(Daily_New_Regular_Users) AS INT64) AS Daily_New_Regular_Users,
  CAST(SUM(Daily_Subscriptions) AS INT64) AS Daily_Subscriptions,
  -- Calculate Daily CAC from aggregated values
  CASE 
    WHEN SUM(Daily_New_Regular_Users) = 0 THEN NULL
    ELSE ROUND(SUM(Daily_Spend) / NULLIF(SUM(Daily_New_Regular_Users), 0), 2)
  END AS Daily_CAC
FROM `variant-finance-data-project.Daedalus.CAC_By_Entity`
GROUP BY Date, Entity
ORDER BY Date, Entity;
