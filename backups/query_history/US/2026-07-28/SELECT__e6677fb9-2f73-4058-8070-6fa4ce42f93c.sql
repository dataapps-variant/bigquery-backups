-- job_id: e6677fb9-2f73-4058-8070-6fa4ce42f93c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:38:43.532000+00:00
-- started: 2026-07-28T06:38:43.653000+00:00
-- ended: 2026-07-28T06:38:44.121000+00:00


SELECT
  ARRAY_AGG(DISTINCT App_Name IGNORE NULLS ORDER BY App_Name) AS app_names,
  ARRAY_AGG(DISTINCT Spend_Country_Code_AFID IGNORE NULLS ORDER BY Spend_Country_Code_AFID) AS countries,
  ARRAY_AGG(DISTINCT CAST(AFID_CHANNEL AS STRING) IGNORE NULLS ORDER BY CAST(AFID_CHANNEL AS STRING)) AS channels,
  ARRAY_AGG(DISTINCT Product_Name_Final_Merged IGNORE NULLS ORDER BY Product_Name_Final_Merged) AS plans
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
