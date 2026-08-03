-- job_id: f3268d5c-70ca-4a71-8f99-8b686aeb139c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:56:13.301000+00:00
-- started: 2026-07-29T08:56:13.383000+00:00
-- ended: 2026-07-29T08:56:13.509000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
