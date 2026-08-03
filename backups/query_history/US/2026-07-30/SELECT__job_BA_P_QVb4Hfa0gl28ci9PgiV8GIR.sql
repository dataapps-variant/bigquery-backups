-- job_id: job_BA_P_QVb4Hfa0gl28ci9PgiV8GIR
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:53:18.492000+00:00
-- started: 2026-07-30T17:53:18.595000+00:00
-- ended: 2026-07-30T17:53:18.707000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, max(`t7d_approval_rate`) AS `MAX_t7d_approval_rate__b805a` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date` ORDER BY `MAX_t7d_approval_rate__b805a` DESC
 LIMIT 10000
