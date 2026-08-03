-- job_id: job_8fHCMW1s97fDCJ56sBs_lBRZOhxL
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T18:32:19.353000+00:00
-- started: 2026-07-30T18:32:19.447000+00:00
-- ended: 2026-07-30T18:32:19.676000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, `fault_category` AS `fault_category`, sum(`pct_of_declined`) AS `SUM_pct_of_declined__59dfb` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date`, `fault_category` ORDER BY `SUM_pct_of_declined__59dfb` DESC
 LIMIT 10000
