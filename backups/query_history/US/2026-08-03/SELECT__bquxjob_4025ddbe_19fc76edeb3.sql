-- job_id: bquxjob_4025ddbe_19fc76edeb3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T11:42:39.627000+00:00
-- started: 2026-08-03T11:42:39.717000+00:00
-- ended: 2026-08-03T11:42:40.070000+00:00

SELECT sum(amount) as sum_spends, App_name FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged` where Date = '2026-08-03' group by App_name
