-- job_id: job_xaX5UY1FbqT8g9o9ONT5uck45L5I
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:36:12.100000+00:00
-- started: 2026-07-28T11:36:12.207000+00:00
-- ended: 2026-07-28T11:36:12.379000+00:00

SELECT sum(amount), date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lagged` where date = "2026-07-28"
group by Date
