-- job_id: job_9Hyj6oHR6coR-gE2rAKCE2vsjcNn
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:53:37.112000+00:00
-- started: 2026-07-28T09:53:37.210000+00:00
-- ended: 2026-07-28T09:53:37.529000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `Product_Name_Final` AS `Product_Name_Final`, sum(`Rebill_value`) AS `SUM_Rebill_value__e8740` 
FROM `VPU_Merged`.`15K_Main_Table_30` 
WHERE `App_Name` IN ('PD') AND `Billing_Cycle` IN (2) GROUP BY `Report_date`, `Product_Name_Final` ORDER BY `SUM_Rebill_value__e8740` DESC
 LIMIT 50000
