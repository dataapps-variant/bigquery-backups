-- job_id: job_idqwds7q2-HlkE1GBXsNfbp-d4-m
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:48.952000+00:00
-- started: 2026-07-28T13:09:48.996000+00:00
-- ended: 2026-07-28T13:09:49.198000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_Level` 
WHERE `App_Name` IN ('CT-JP') GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
