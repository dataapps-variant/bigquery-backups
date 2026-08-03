-- job_id: bquxjob_631b8d9d_19fb7397cff
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:10:32.358000+00:00
-- started: 2026-07-31T08:10:32.469000+00:00
-- ended: 2026-07-31T08:10:32.665000+00:00

SELECT event_date, COUNT(DISTINCT account_name) AS accounts
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
WHERE event_date >= '2026-07-28'
GROUP BY event_date ORDER BY event_date DESC;
