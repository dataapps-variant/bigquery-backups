-- job_id: 4ea3a82d-b1d9-4448-aae2-c86afb03cf93
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:03:30.346000+00:00
-- started: 2026-07-28T13:03:30.446000+00:00
-- ended: 2026-07-28T13:03:30.639000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
