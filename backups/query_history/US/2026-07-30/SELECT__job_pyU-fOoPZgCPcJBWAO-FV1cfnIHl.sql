-- job_id: job_pyU-fOoPZgCPcJBWAO-FV1cfnIHl
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:13:20.104000+00:00
-- started: 2026-07-30T14:13:20.213000+00:00
-- ended: 2026-07-30T14:13:20.591000+00:00


  SELECT COUNT(DISTINCT CAST(AFID_CHANNEL AS STRING)) afids,
         COUNT(DISTINCT Spend_Country_Code_AFID) countries,
         COUNT(DISTINCT App_Name) entities FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
