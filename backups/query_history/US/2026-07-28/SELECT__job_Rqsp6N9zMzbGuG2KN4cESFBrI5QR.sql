-- job_id: job_Rqsp6N9zMzbGuG2KN4cESFBrI5QR
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:43:47.852000+00:00
-- started: 2026-07-28T17:43:47.931000+00:00
-- ended: 2026-07-28T17:43:48.133000+00:00

SELECT sum(amount), date FROM 
`variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lag_table1` where date = "2026-07-28"
group by Date
