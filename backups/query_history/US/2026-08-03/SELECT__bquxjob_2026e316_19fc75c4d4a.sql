-- job_id: bquxjob_2026e316_19fc75c4d4a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T11:22:23.515000+00:00
-- started: 2026-08-03T11:22:24.705000+00:00
-- ended: 2026-08-03T11:22:27.980000+00:00

SELECT sum(amount) as sum_spends, App_name FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated` where Date = '2026-08-03' group by App_name
