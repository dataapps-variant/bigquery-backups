-- job_id: bc200e3a-d429-49c1-ad70-3fca6f2492a9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:39:24.979000+00:00
-- started: 2026-07-28T10:39:25.120000+00:00
-- ended: 2026-07-28T10:39:25.233000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
