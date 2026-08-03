-- job_id: job_umXQpLLFHEONdPR8_KNFHgbhyHus
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:51:29.471000+00:00
-- started: 2026-07-28T10:51:29.736000+00:00
-- ended: 2026-07-28T10:51:30.059000+00:00

SELECT sum(amount), App_name date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
where date = "2026-07-28"
group by App_name, Date
