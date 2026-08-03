-- job_id: job_098aZdIqsw9RNs87nRTi1gXPs5eo
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:36:11.379000+00:00
-- started: 2026-07-31T13:36:11.468000+00:00
-- ended: 2026-07-31T13:36:11.650000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, max(`t7d_approval_rate`) AS `MAX_t7d_approval_rate__b805a` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date` ORDER BY `MAX_t7d_approval_rate__b805a` DESC
 LIMIT 10000
