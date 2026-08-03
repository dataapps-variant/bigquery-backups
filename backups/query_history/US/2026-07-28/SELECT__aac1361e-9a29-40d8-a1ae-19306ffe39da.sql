-- job_id: aac1361e-9a29-40d8-a1ae-19306ffe39da
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:15:27.428000+00:00
-- started: 2026-07-28T14:15:27.520000+00:00
-- ended: 2026-07-28T14:15:27.635000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
