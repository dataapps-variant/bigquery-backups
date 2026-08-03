-- job_id: job_raTIJPqs52MCupi8mYKtfKU99w6s
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:09:49.747000+00:00
-- started: 2026-07-28T11:09:49.943000+00:00
-- ended: 2026-07-28T11:09:50.296000+00:00

SELECT sum(amount), App_name date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
where date = "2026-07-28"
group by App_name, Date
