-- job_id: job_YPuKhejQgo3Zxz9GPJT2-EiwD3dh
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:36:00.858000+00:00
-- started: 2026-07-28T11:36:01.040000+00:00
-- ended: 2026-07-28T11:36:01.252000+00:00

SELECT sum(amount), date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lagged` where date = "2026-07-23"
group by Date
