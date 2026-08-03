-- job_id: job_hImqPPT2NngMK6kXjJkMXB7Z1_oT
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:24:57.499000+00:00
-- started: 2026-07-29T08:24:57.625000+00:00
-- ended: 2026-07-29T08:24:57.661000+00:00

SELECT App_name, Sum(Amount) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lag_table1`
Where Date = "2026-07-29"
