-- job_id: job_sKiCsGcZ83np3PHkm_WyXEF2_3IV
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:34:20.694000+00:00
-- started: 2026-07-31T13:34:20.788000+00:00
-- ended: 2026-07-31T13:34:20.962000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, max(`t7d_success_pct`) AS `MAX_t7d_success_pct__656ac` 
FROM `Utilities`.`Rebill_Success_Percent_summary` GROUP BY `scheduled_rebill_date` ORDER BY `MAX_t7d_success_pct__656ac` DESC
 LIMIT 10000
