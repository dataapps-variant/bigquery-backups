-- job_id: job_Bx3wChaaHvzSO_GsyKek1E2M3fU6
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:50:39.944000+00:00
-- started: 2026-07-31T13:50:40.080000+00:00
-- ended: 2026-07-31T13:50:40.271000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, `fault_category` AS `fault_category`, sum(`pct_of_declined`) AS `SUM_pct_of_declined__59dfb` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date`, `fault_category` ORDER BY `SUM_pct_of_declined__59dfb` DESC
 LIMIT 10000
