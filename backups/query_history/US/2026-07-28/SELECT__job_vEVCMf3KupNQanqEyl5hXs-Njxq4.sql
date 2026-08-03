-- job_id: job_vEVCMf3KupNQanqEyl5hXs-Njxq4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:09:52.198000+00:00
-- started: 2026-07-28T15:09:52.301000+00:00
-- ended: 2026-07-28T15:09:54.131000+00:00

SELECT activity_date, SUM(gross_revenue_usd) AS rev, SUM(user_count) AS users FROM `variant-finance-data-project.R100.R100_Historical_Main` GROUP BY activity_date ORDER BY activity_date DESC LIMIT 8
