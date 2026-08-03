-- job_id: e3b9a470-a22d-4b79-9f5a-255fdb8d53cd
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:12:05.811000+00:00
-- started: 2026-07-31T09:12:05.893000+00:00
-- ended: 2026-07-31T09:12:06.181000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
