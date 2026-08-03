-- job_id: job_-f-j_FI44duJ6Byf0S58bJt_204_
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:57:09.092000+00:00
-- started: 2026-07-31T13:57:09.159000+00:00
-- ended: 2026-07-31T13:57:09.277000+00:00

SELECT DATE_TRUNC(`scheduled_rebill_date`, DAY) AS `scheduled_rebill_date`, max(`t7d_success_pct`) AS `MAX_t7d_success_pct__656ac` 
FROM `Utilities`.`Rebill_Success_Percent_summary_countrywise` GROUP BY `scheduled_rebill_date` ORDER BY `MAX_t7d_success_pct__656ac` DESC
 LIMIT 10000
