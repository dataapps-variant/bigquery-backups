-- job_id: c1ee3616-a4fb-4773-9214-58b778bb4bc1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:52:39.078000+00:00
-- started: 2026-07-28T15:52:39.190000+00:00
-- ended: 2026-07-28T15:52:39.377000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
