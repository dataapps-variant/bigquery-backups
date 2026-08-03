-- job_id: job_K2YLNLBG0t7WTlKt6ZJysXWvhLq1
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:42.563000+00:00
-- started: 2026-07-31T13:42:42.642000+00:00
-- ended: 2026-07-31T13:42:43.005000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, `decline_reason_category` AS `decline_reason_category`, sum(`pct_of_declined`) AS `SUM_pct_of_declined__59dfb` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date`, `decline_reason_category` ORDER BY `SUM_pct_of_declined__59dfb` DESC
 LIMIT 10000
