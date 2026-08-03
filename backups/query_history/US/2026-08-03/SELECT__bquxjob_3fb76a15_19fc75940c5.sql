-- job_id: bquxjob_3fb76a15_19fc75940c5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T11:19:03.105000+00:00
-- started: 2026-08-03T11:19:03.443000+00:00
-- ended: 2026-08-03T11:19:03.629000+00:00

SELECT sum(amount) as sum_spends, App_name FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged` where Date = '2026-08-03' group by App_name
