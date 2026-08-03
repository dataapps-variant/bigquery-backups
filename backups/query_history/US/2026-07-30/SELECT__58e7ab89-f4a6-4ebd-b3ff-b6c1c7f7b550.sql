-- job_id: 58e7ab89-f4a6-4ebd-b3ff-b6c1c7f7b550
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T17:32:38.767000+00:00
-- started: 2026-07-30T17:32:38.860000+00:00
-- ended: 2026-07-30T17:32:39.127000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
