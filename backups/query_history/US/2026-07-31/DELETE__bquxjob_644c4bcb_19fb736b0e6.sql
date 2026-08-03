-- job_id: bquxjob_644c4bcb_19fb736b0e6
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:07:29.123000+00:00
-- started: 2026-07-31T08:07:29.496000+00:00
-- ended: 2026-07-31T08:07:30.894000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
WHERE run_date >= '2026-07-28';
