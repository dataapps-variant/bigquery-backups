-- job_id: 5df35d28-0b2d-454b-b7d1-b58de5a72ccf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:41.754000+00:00
-- started: 2026-07-29T09:53:41.830000+00:00
-- ended: 2026-07-29T09:53:41.977000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
