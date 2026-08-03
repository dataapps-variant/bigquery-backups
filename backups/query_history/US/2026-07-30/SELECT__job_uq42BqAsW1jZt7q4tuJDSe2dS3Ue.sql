-- job_id: job_uq42BqAsW1jZt7q4tuJDSe2dS3Ue
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T18:32:19.356000+00:00
-- started: 2026-07-30T18:32:19.452000+00:00
-- ended: 2026-07-30T18:32:19.669000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, `decline_reason_category` AS `decline_reason_category`, sum(`pct_of_declined`) AS `SUM_pct_of_declined__59dfb` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date`, `decline_reason_category` ORDER BY `SUM_pct_of_declined__59dfb` DESC
 LIMIT 10000
