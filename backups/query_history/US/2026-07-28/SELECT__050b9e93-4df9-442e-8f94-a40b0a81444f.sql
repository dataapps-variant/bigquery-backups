-- job_id: 050b9e93-4df9-442e-8f94-a40b0a81444f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:50:00.521000+00:00
-- started: 2026-07-28T16:50:00.625000+00:00
-- ended: 2026-07-28T16:50:01.297000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
