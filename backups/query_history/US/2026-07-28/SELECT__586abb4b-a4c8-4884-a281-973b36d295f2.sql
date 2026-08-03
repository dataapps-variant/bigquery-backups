-- job_id: 586abb4b-a4c8-4884-a281-973b36d295f2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:46:56.970000+00:00
-- started: 2026-07-28T14:46:57.072000+00:00
-- ended: 2026-07-28T14:46:57.182000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
