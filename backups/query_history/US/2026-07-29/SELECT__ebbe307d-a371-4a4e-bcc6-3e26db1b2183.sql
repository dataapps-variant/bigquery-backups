-- job_id: ebbe307d-a371-4a4e-bcc6-3e26db1b2183
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:54:39.196000+00:00
-- started: 2026-07-29T09:54:39.240000+00:00
-- ended: 2026-07-29T09:54:39.348000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
