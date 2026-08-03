-- job_id: db7de24e-0642-40a5-b8f0-8727378b8ca3
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:30:13.255000+00:00
-- started: 2026-07-31T12:30:13.557000+00:00
-- ended: 2026-07-31T12:30:14.027000+00:00

WITH d AS (
  SELECT Date, App_name, sum(Amount) AS spend FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Merged_Spend_View` 
WHERE Date BETWEEN current_date-8 AND current_date-1 AND App_name NOT IN ('CN', 'AT', 'IQ')
GROUP BY Date, App_name
ORDER BY Date DESC, App_name ASC
),
p AS (
  SELECT App_name, countif(Date < current_date-1) AS day_count FROM d GROUP BY d.App_name
)

SELECT p.App_name AS app, p.day_count, t1.spend, current_date-1 AS report_date FROM p
LEFT JOIN (SELECT App_name, spend FROM d WHERE Date = current_date-1) AS t1 ON p.App_name = t1.App_name
WHERE p.day_count >= 6 AND spend IS NULL
