-- job_id: dcc8e689-20c8-4300-8a61-68e863976af9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:29.666000+00:00
-- started: 2026-07-29T09:56:29.736000+00:00
-- ended: 2026-07-29T09:56:29.855000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
