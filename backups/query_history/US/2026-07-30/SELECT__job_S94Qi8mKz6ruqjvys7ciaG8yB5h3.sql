-- job_id: job_S94Qi8mKz6ruqjvys7ciaG8yB5h3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:13:21.062000+00:00
-- started: 2026-07-30T14:13:21.160000+00:00
-- ended: 2026-07-30T14:13:21.497000+00:00


  SELECT App_Name, COUNT(DISTINCT CAST(AFID_CHANNEL AS STRING)) afids,
         COUNT(DISTINCT Spend_Country_Code_AFID) countries
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` GROUP BY 1 ORDER BY 1
