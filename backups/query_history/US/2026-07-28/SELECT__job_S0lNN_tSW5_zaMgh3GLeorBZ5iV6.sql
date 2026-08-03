-- job_id: job_S0lNN_tSW5_zaMgh3GLeorBZ5iV6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:22:22.923000+00:00
-- started: 2026-07-28T11:22:23.145000+00:00
-- ended: 2026-07-28T11:22:23.548000+00:00

SELECT sum(amount) date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lagged` where date = "2026-07-28"
