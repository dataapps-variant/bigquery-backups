-- job_id: 5566cc72-a85b-4659-9c11-afcddc5c2933
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:42.157000+00:00
-- started: 2026-07-29T09:53:42.244000+00:00
-- ended: 2026-07-29T09:53:42.313000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
