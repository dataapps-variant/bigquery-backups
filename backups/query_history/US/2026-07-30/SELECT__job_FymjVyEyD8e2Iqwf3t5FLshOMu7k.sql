-- job_id: job_FymjVyEyD8e2Iqwf3t5FLshOMu7k
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:52:56.375000+00:00
-- started: 2026-07-30T17:52:56.488000+00:00
-- ended: 2026-07-30T17:52:56.719000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, max(`t7d_approval_rate`) AS `MAX_t7d_approval_rate__b805a` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date` ORDER BY `MAX_t7d_approval_rate__b805a` DESC
 LIMIT 10000
