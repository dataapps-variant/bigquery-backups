-- job_id: bquxjob_1bddf75_19fb727e5da
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T07:51:20.124000+00:00
-- started: 2026-07-31T07:51:20.242000+00:00
-- ended: 2026-07-31T07:51:20.544000+00:00

SELECT account_name, COUNT(*) AS row1s
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
WHERE event_date = '2026-07-28'
GROUP BY account_name ORDER BY account_name;
