-- job_id: 9c5ab69b-5ab7-43c4-8e9b-f351e721037d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:33:57.083000+00:00
-- started: 2026-07-28T05:33:57.172000+00:00
-- ended: 2026-07-28T05:33:57.271000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
