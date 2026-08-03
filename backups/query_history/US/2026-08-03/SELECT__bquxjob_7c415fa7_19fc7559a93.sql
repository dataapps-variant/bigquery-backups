-- job_id: bquxjob_7c415fa7_19fc7559a93
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T11:15:03.794000+00:00
-- started: 2026-08-03T11:15:03.894000+00:00
-- ended: 2026-08-03T11:15:04.184000+00:00

SELECT sum(amount), App_name FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged` group by App_name
