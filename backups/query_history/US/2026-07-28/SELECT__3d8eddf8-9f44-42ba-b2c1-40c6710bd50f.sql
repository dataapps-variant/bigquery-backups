-- job_id: 3d8eddf8-9f44-42ba-b2c1-40c6710bd50f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:36.221000+00:00
-- started: 2026-07-28T10:06:36.316000+00:00
-- ended: 2026-07-28T10:06:36.490000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
