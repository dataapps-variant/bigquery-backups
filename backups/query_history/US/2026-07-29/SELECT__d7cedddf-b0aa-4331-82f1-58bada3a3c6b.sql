-- job_id: d7cedddf-b0aa-4331-82f1-58bada3a3c6b
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:11:37.797000+00:00
-- started: 2026-07-29T11:11:37.953000+00:00
-- ended: 2026-07-29T11:11:38.142000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
