-- job_id: job_YTzZi6NaR0mkAOUZp9gdXU00cF5B
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:53:37.105000+00:00
-- started: 2026-07-28T09:53:37.215000+00:00
-- ended: 2026-07-28T09:53:37.467000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `App_Name` AS `App_Name`, sum(`ARPU_Discounted`) AS `ARPU`, sum(`Net_ARPU_Discounted`) AS `Net_ARPU_a9189`, sum(`Net_LTV_Discounted`) AS `Net_LTV_36f94`, sum(`Recent_CAC_MP`) AS `Recent_CAC_74f92` 
FROM `VPU_Merged`.`Entity_Level_Main_MP` 
WHERE `App_Name` IN ('PD') GROUP BY `Report_date`, `App_Name` ORDER BY `ARPU` DESC
 LIMIT 50000
