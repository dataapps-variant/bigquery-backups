-- job_id: job_yAo41_RSWnWu5-2Pwba_cFhnX3jw
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:10.137000+00:00
-- started: 2026-07-28T09:52:10.242000+00:00
-- ended: 2026-07-28T09:52:10.450000+00:00

SELECT `Product_Name_Final` AS `Product_Name_Final`, `Trial_Type` AS `Trial_Type`, `Trial_Period` AS `Trial_Period`, `Trial_Price` AS `Trial_Price`, `Reg_BC_Period` AS `Reg_BC_Period`, `Regular_Price` AS `Regular_Price` 
FROM `VPU_Merged`.`Plan_List` 
WHERE `App_Name` IN ('PD')
 LIMIT 1000
