-- job_id: job_ugKM-sBUUUczqsN3hyIhsCHM-cwI
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:34:20.652000+00:00
-- started: 2026-07-31T13:34:20.737000+00:00
-- ended: 2026-07-31T13:34:20.862000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, `fault_category` AS `fault_category`, sum(`pct_of_failed`) AS `SUM_pct_of_failed__92cc2` 
FROM `Utilities`.`Rebill_Success_Percent_summary` GROUP BY `scheduled_rebill_date`, `fault_category` ORDER BY `SUM_pct_of_failed__92cc2` DESC
 LIMIT 10000
