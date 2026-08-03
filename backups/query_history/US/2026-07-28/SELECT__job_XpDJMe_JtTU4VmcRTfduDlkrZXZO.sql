-- job_id: job_XpDJMe_JtTU4VmcRTfduDlkrZXZO
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:10.534000+00:00
-- started: 2026-07-28T09:52:10.652000+00:00
-- ended: 2026-07-28T09:52:10.941000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `Product_Name_Final` AS `Product_Name_Final`, sum(`Refund_ratio`) AS `SUM_Refund_ratio__de0d3` 
FROM `VPU_Merged`.`15K_Main_Table_30` 
WHERE `Billing_Cycle` IN (4) AND `App_Name` IN ('PD') GROUP BY `Report_date`, `Product_Name_Final` ORDER BY `SUM_Refund_ratio__de0d3` DESC
 LIMIT 10000
