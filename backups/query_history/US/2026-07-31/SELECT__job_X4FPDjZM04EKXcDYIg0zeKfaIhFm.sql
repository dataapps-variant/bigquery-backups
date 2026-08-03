-- job_id: job_X4FPDjZM04EKXcDYIg0zeKfaIhFm
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:41.718000+00:00
-- started: 2026-07-31T13:42:41.788000+00:00
-- ended: 2026-07-31T13:42:41.928000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, `decline_reason_category` AS `decline_reason_category`, sum(`pct_of_failed`) AS `SUM_pct_of_failed__92cc2` 
FROM `Utilities`.`Rebill_Success_Percent_summary_countrywise` GROUP BY `scheduled_rebill_date`, `decline_reason_category` ORDER BY `SUM_pct_of_failed__92cc2` DESC
 LIMIT 10000
