-- job_id: job_gP0ttYej8hZji4hdIoF-XhILK_Gq
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:50:39.893000+00:00
-- started: 2026-07-31T13:50:39.997000+00:00
-- ended: 2026-07-31T13:50:40.175000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, max(`t7d_approval_rate`) AS `MAX_t7d_approval_rate__b805a` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date` ORDER BY `MAX_t7d_approval_rate__b805a` DESC
 LIMIT 10000
