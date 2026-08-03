-- job_id: job_BWxamECKP92U6rgQvqPMaBaBDavs
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:43:32.158000+00:00
-- started: 2026-07-28T17:43:32.279000+00:00
-- ended: 2026-07-28T17:43:32.508000+00:00

SELECT sum(amount), date FROM 
`variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lag_table1` where date = "2026-07-27"
group by Date
