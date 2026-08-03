-- job_id: job_kuUcZE64yZu16zOpe7pLpFOjqOzo
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:25:01.744000+00:00
-- started: 2026-07-29T08:25:01.864000+00:00
-- ended: 2026-07-29T08:25:02.086000+00:00

SELECT App_name, Sum(Amount) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lag_table1`
Where Date = "2026-07-29"
Group by App_name
Order by App_name
