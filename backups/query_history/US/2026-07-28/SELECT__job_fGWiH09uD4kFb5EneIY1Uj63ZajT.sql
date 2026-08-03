-- job_id: job_fGWiH09uD4kFb5EneIY1Uj63ZajT
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:22:15.471000+00:00
-- started: 2026-07-28T11:22:15.654000+00:00
-- ended: 2026-07-28T11:22:15.684000+00:00

SELECT sum(amount) date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lagged` where date = "2026-07-28"
group by Date
