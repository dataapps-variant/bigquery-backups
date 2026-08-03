-- job_id: job_MAoUqeCTbGJiR6b06IUe2h_-Xutz
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:25:30.509000+00:00
-- started: 2026-07-28T09:25:30.594000+00:00
-- ended: 2026-07-28T09:25:31.315000+00:00

SELECT * FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table` 
where AFID = 15
and Report_date >= "2026-01-01"
