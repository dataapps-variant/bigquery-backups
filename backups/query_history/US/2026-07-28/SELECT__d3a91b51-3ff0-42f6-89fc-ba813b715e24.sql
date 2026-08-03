-- job_id: d3a91b51-3ff0-42f6-89fc-ba813b715e24
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:47:17.715000+00:00
-- started: 2026-07-28T14:47:17.816000+00:00
-- ended: 2026-07-28T14:47:17.944000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
