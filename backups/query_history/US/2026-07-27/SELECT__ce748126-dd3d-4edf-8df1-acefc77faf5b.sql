-- job_id: ce748126-dd3d-4edf-8df1-acefc77faf5b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T13:39:07.991000+00:00
-- started: 2026-07-27T13:39:08.101000+00:00
-- ended: 2026-07-27T13:39:08.196000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
