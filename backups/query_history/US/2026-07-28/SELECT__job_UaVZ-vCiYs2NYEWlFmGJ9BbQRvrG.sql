-- job_id: job_UaVZ-vCiYs2NYEWlFmGJ9BbQRvrG
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:10.367000+00:00
-- started: 2026-07-28T09:52:10.486000+00:00
-- ended: 2026-07-28T09:52:10.666000+00:00

SELECT DATE_TRUNC(`Date_of_Sale`, DAY) AS `Date_of_Sale`, `Product_Name_Final` AS `Product_Name_Final`, sum(`Daily_Users`) AS `SUM_Daily_Users__ed29f` 
FROM `VPU_Merged`.`User_Count_by_Day` 
WHERE `Date_of_Sale` >= CAST('2026-01-01' AS DATE) AND `Date_of_Sale` < CAST('2027-01-01' AS DATE) AND `App_Name` IN ('PD') GROUP BY `Date_of_Sale`, `Product_Name_Final` ORDER BY `SUM_Daily_Users__ed29f` DESC
 LIMIT 50000
