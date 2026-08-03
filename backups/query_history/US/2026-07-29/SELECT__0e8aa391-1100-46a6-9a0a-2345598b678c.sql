-- job_id: 0e8aa391-1100-46a6-9a0a-2345598b678c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:12:10.789000+00:00
-- started: 2026-07-29T11:12:10.919000+00:00
-- ended: 2026-07-29T11:12:11.083000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
