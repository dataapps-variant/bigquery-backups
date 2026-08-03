-- job_id: job_jZFa_-5angFia-iyn-To1qm5MyI5
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:21.518000+00:00
-- started: 2026-07-28T13:09:21.605000+00:00
-- ended: 2026-07-28T13:09:21.816000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_Level` 
WHERE `App_Name` IN ('RT') GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
