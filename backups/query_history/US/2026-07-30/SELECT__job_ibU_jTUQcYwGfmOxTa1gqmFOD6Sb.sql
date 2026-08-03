-- job_id: job_ibU_jTUQcYwGfmOxTa1gqmFOD6Sb
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T18:32:19.339000+00:00
-- started: 2026-07-30T18:32:19.449000+00:00
-- ended: 2026-07-30T18:32:19.687000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, max(`t7d_approval_rate`) AS `MAX_t7d_approval_rate__b805a` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date` ORDER BY `MAX_t7d_approval_rate__b805a` DESC
 LIMIT 10000
