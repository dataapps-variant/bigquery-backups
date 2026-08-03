-- job_id: job_GRrVcX28Rvqx1hML3z5XAiJUcH3Q
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:24.295000+00:00
-- started: 2026-07-28T13:10:24.370000+00:00
-- ended: 2026-07-28T13:10:24.593000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_Level` 
WHERE `Report_date` >= CAST('2026-07-27' AS DATE) AND `Report_date` < CAST('2026-07-28' AS DATE) AND `App_Name` IN ('RL') GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
