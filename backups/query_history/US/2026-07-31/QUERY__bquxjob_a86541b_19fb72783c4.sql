-- job_id: bquxjob_a86541b_19fb72783c4
-- user: dataapps@variant.net
-- statement_type: None
-- created: 2026-07-31T07:50:54.504000+00:00
-- started: 2026-07-31T07:50:54.515000+00:00
-- ended: 2026-07-31T07:50:54.515000+00:00

SELECT app_name, COUNT(*) AS rows,
       SUM(CASE WHEN display_url_domain LIKE 'You (%' THEN 1 ELSE 0 END) AS has_you
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
WHERE event_date = '2026-07-28'
GROUP BY app_name ORDER BY app_name;
