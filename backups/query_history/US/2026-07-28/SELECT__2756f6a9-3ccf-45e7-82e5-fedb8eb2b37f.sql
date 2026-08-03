-- job_id: 2756f6a9-3ccf-45e7-82e5-fedb8eb2b37f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:33:56.166000+00:00
-- started: 2026-07-28T05:33:56.269000+00:00
-- ended: 2026-07-28T05:33:56.413000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
