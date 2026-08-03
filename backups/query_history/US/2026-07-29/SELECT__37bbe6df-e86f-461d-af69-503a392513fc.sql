-- job_id: 37bbe6df-e86f-461d-af69-503a392513fc
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:41.694000+00:00
-- started: 2026-07-29T09:53:41.758000+00:00
-- ended: 2026-07-29T09:53:41.927000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
