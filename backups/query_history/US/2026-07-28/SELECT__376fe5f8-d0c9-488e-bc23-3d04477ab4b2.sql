-- job_id: 376fe5f8-d0c9-488e-bc23-3d04477ab4b2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:30:26.441000+00:00
-- started: 2026-07-28T11:30:26.553000+00:00
-- ended: 2026-07-28T11:30:26.669000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
