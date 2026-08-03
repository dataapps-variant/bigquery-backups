-- job_id: job_4PNitGpwzLGRQi0NzAmxrdbG9tcp
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:53:17.356000+00:00
-- started: 2026-07-30T17:53:17.432000+00:00
-- ended: 2026-07-30T17:53:17.530000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, `decline_reason_category` AS `decline_reason_category`, sum(`pct_of_failed`) AS `SUM_pct_of_failed__92cc2` 
FROM `Utilities`.`Rebill_Success_Percent_summary_countrywise` GROUP BY `scheduled_rebill_date`, `decline_reason_category` ORDER BY `SUM_pct_of_failed__92cc2` DESC
 LIMIT 10000
