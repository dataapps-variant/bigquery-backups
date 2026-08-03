-- job_id: 0856eaa8-3d32-47aa-8802-d43d6c665dd1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:35:28.632000+00:00
-- started: 2026-07-29T09:35:28.713000+00:00
-- ended: 2026-07-29T09:35:28.885000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
