-- job_id: 523e9588-25f3-4183-9065-26a12d40afc7
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T17:16:45.862000+00:00
-- started: 2026-07-27T17:16:45.944000+00:00
-- ended: 2026-07-27T17:16:46.032000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
