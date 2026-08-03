-- job_id: job_Sn-mkFYwYh1l8kNAkDP2myyXP-9V
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:10.542000+00:00
-- started: 2026-07-28T09:52:10.653000+00:00
-- ended: 2026-07-28T09:52:10.883000+00:00

SELECT DATE_TRUNC(`Date`, DAY) AS `Date`, Product_Name_Final_Merged AS `Product_Name_Final`, sum(`allocated_spend`) AS `SUM_allocated_spend__d74fb` 
FROM `Ad_spend_data`.`Merged_Spend_Split_TBL` 
WHERE `App_Name` IN ('PD') GROUP BY `Date`, `Product_Name_Final` ORDER BY `SUM_allocated_spend__d74fb` DESC
 LIMIT 50000
