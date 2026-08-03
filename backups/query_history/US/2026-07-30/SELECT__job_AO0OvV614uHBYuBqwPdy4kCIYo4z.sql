-- job_id: job_AO0OvV614uHBYuBqwPdy4kCIYo4z
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:53:10.700000+00:00
-- started: 2026-07-30T17:53:10.804000+00:00
-- ended: 2026-07-30T17:53:10.909000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, `fault_category` AS `fault_category`, sum(`pct_of_declined`) AS `SUM_pct_of_declined__59dfb` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date`, `fault_category` ORDER BY `SUM_pct_of_declined__59dfb` DESC
 LIMIT 10000
