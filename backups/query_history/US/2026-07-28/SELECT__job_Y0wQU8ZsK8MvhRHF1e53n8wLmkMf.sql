-- job_id: job_Y0wQU8ZsK8MvhRHF1e53n8wLmkMf
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:08:24.678000+00:00
-- started: 2026-07-28T14:08:24.920000+00:00
-- ended: 2026-07-28T14:08:25.357000+00:00

SELECT sum(amount), date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
where date = "2026-07-28"
group by Date
