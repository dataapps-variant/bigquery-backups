-- job_id: bquxjob_58bc571e_19fc75647f6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T11:15:48.237000+00:00
-- started: 2026-08-03T11:15:48.333000+00:00
-- ended: 2026-08-03T11:15:48.508000+00:00

SELECT sum(amount), App_name FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged` where Date = '2026-08-03' group by App_name
