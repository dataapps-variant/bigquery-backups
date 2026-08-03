-- job_id: job_OibA8bTPtt1ocTNpQUEDixxhSO2A
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:25:36.791000+00:00
-- started: 2026-07-28T09:25:36.870000+00:00
-- ended: 2026-07-28T09:25:37.854000+00:00

SELECT * FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table` 
where AFID = 15
and Report_date >= "2026-05-01"
