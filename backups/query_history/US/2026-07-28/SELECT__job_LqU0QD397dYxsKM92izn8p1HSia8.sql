-- job_id: job_LqU0QD397dYxsKM92izn8p1HSia8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:57:27.597000+00:00
-- started: 2026-07-28T11:57:27.691000+00:00
-- ended: 2026-07-28T11:57:27.903000+00:00

SELECT Distinct(AFID_Suffix) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID` 
where App_Name = "PD"
