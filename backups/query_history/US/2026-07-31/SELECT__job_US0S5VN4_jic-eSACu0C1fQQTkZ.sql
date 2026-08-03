-- job_id: job_US0S5VN4_jic-eSACu0C1fQQTkZ_
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:55:46.483000+00:00
-- started: 2026-07-31T13:55:46.562000+00:00
-- ended: 2026-07-31T13:55:46.687000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, max(`t7d_success_pct`) AS `MAX_t7d_success_pct__656ac` 
FROM `Utilities`.`Rebill_Success_Percent_summary` GROUP BY `scheduled_rebill_date` ORDER BY `MAX_t7d_success_pct__656ac` DESC
 LIMIT 10000
