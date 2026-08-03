-- job_id: job_8dpOc1YBZ22ZjoWyLI0PnJoLTVN2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:43:07.769000+00:00
-- started: 2026-07-28T10:43:08.062000+00:00
-- ended: 2026-07-28T10:43:08.476000+00:00

SELECT sum(amount), App_name date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
where date = "2026-07-28"
group by App_name, Date
