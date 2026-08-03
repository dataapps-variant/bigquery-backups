-- job_id: bquxjob_9dc10ac_19fb72821d2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T07:51:35.132000+00:00
-- started: 2026-07-31T07:51:35.265000+00:00
-- ended: 2026-07-31T07:51:35.558000+00:00

SELECT run_date, status, accounts_loaded, accounts_empty, accounts_missing, missing_list
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
ORDER BY run_date DESC LIMIT 5;
