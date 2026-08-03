-- job_id: bquxjob_7319689a_19fb728f9bd
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T07:52:30.203000+00:00
-- started: 2026-07-31T07:52:30.683000+00:00
-- ended: 2026-07-31T07:52:40.671000+00:00

SELECT account_name, COUNT(*) AS rowqs
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
WHERE event_date = '2026-07-29'
GROUP BY account_name ORDER BY account_name;
