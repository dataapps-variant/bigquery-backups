-- job_id: job_kULukxDPLQjZBlofuqfGcIxbcr2o
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:56:12.926000+00:00
-- started: 2026-07-28T11:56:13.034000+00:00
-- ended: 2026-07-28T11:56:13.456000+00:00

SELECT Distinct(AFID) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
where App_Name = "PD"
