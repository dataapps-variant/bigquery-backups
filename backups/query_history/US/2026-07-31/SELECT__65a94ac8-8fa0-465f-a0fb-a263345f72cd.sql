-- job_id: 65a94ac8-8fa0-465f-a0fb-a263345f72cd
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:50:09.090000+00:00
-- started: 2026-07-31T09:50:09.189000+00:00
-- ended: 2026-07-31T09:50:09.280000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
