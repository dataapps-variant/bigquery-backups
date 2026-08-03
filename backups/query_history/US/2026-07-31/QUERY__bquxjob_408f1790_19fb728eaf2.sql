-- job_id: bquxjob_408f1790_19fb728eaf2
-- user: dataapps@variant.net
-- statement_type: None
-- created: 2026-07-31T07:52:26.573000+00:00
-- started: 2026-07-31T07:52:26.584000+00:00
-- ended: 2026-07-31T07:52:26.584000+00:00

SELECT account_name, COUNT(*) AS rows
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
WHERE event_date = '2026-07-29'
GROUP BY account_name ORDER BY account_name;
