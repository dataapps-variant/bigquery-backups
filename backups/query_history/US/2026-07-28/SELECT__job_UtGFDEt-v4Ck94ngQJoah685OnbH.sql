-- job_id: job_UtGFDEt-v4Ck94ngQJoah685OnbH
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:42:50.769000+00:00
-- started: 2026-07-28T17:42:50.958000+00:00
-- ended: 2026-07-28T17:42:51.307000+00:00

SELECT sum(amount), date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
where date = "2026-07-28"
group by Date
