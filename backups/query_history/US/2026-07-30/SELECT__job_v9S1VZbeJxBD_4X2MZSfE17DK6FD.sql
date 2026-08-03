-- job_id: job_v9S1VZbeJxBD_4X2MZSfE17DK6FD
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:53:18.488000+00:00
-- started: 2026-07-30T17:53:18.565000+00:00
-- ended: 2026-07-30T17:53:18.687000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, `fault_category` AS `fault_category`, sum(`pct_of_declined`) AS `SUM_pct_of_declined__59dfb` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date`, `fault_category` ORDER BY `SUM_pct_of_declined__59dfb` DESC
 LIMIT 10000
