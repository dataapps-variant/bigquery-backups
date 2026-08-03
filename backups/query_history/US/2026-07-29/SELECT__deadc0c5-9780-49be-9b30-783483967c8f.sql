-- job_id: deadc0c5-9780-49be-9b30-783483967c8f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:41.855000+00:00
-- started: 2026-07-29T09:53:41.942000+00:00
-- ended: 2026-07-29T09:53:42.030000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
