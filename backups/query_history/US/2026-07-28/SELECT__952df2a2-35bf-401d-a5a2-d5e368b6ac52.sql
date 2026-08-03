-- job_id: 952df2a2-35bf-401d-a5a2-d5e368b6ac52
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:46:37.374000+00:00
-- started: 2026-07-28T11:46:37.481000+00:00
-- ended: 2026-07-28T11:46:37.581000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
