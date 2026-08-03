-- job_id: job_tNXJJSbKRXXhaqZH-6e9nNkna7Wf
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:51.826000+00:00
-- started: 2026-07-28T13:09:51.898000+00:00
-- ended: 2026-07-28T13:09:51.980000+00:00

SELECT `Product_Name_Final` AS `Product_Name_Final` 
FROM `CWC`.`CWC_Main_Table` 
WHERE `App_Name` IN ('AT') GROUP BY `Product_Name_Final` ORDER BY `Product_Name_Final` ASC
 LIMIT 1000
