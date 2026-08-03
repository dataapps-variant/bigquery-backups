-- job_id: 0149c704-9863-4cf3-82d6-0bd5501e58a5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:04:56.198000+00:00
-- started: 2026-07-28T12:04:56.300000+00:00
-- ended: 2026-07-28T12:04:56.406000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
