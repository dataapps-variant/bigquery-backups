-- job_id: job_y2QQVH8mdmkdU1nFHI6gB3hD6kbd
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:57:09.190000+00:00
-- started: 2026-07-31T13:57:09.268000+00:00
-- ended: 2026-07-31T13:57:09.378000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, `fault_category` AS `fault_category`, sum(`pct_of_failed`) AS `SUM_pct_of_failed__92cc2` 
FROM `Utilities`.`Rebill_Success_Percent_summary_countrywise` GROUP BY `scheduled_rebill_date`, `fault_category` ORDER BY `SUM_pct_of_failed__92cc2` DESC
 LIMIT 10000
