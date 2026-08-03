-- job_id: job_aGjUSlDZ3nrjlrwJNuK6xoi43_cq
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:25:33.293000+00:00
-- started: 2026-07-29T08:25:33.571000+00:00
-- ended: 2026-07-29T08:25:34.034000+00:00

SELECT App_name, Sum(Amount) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
Where Date = "2026-07-29"
Group by App_name
Order by App_name
