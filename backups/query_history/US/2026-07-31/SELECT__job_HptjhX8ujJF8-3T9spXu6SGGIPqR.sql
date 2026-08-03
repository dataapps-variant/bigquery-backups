-- job_id: job_HptjhX8ujJF8-3T9spXu6SGGIPqR
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:55:46.493000+00:00
-- started: 2026-07-31T13:55:46.621000+00:00
-- ended: 2026-07-31T13:55:46.819000+00:00

SELECT DATE_TRUNC(`order_date`, DAY) AS `order_date`, `decline_reason_category` AS `decline_reason_category`, sum(`pct_of_declined`) AS `SUM_pct_of_declined__59dfb` 
FROM `Utilities`.`MIT_Approval_Rate_summary` GROUP BY `order_date`, `decline_reason_category` ORDER BY `SUM_pct_of_declined__59dfb` DESC
 LIMIT 10000
