-- job_id: job__DxPmcQ0Ni4ltdWBnSyw59sOFJ9s
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:36:11.371000+00:00
-- started: 2026-07-31T13:36:11.442000+00:00
-- ended: 2026-07-31T13:36:11.557000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, max(`t7d_success_pct`) AS `MAX_t7d_success_pct__656ac` 
FROM `Utilities`.`Rebill_Success_Percent_summary` GROUP BY `scheduled_rebill_date` ORDER BY `MAX_t7d_success_pct__656ac` DESC
 LIMIT 10000
