-- job_id: a40bbc34-df5d-459d-b9a0-efbd9ac97086
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:29.960000+00:00
-- started: 2026-07-29T09:56:30.033000+00:00
-- ended: 2026-07-29T09:56:30.146000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
