-- job_id: cd61b404-a557-4662-a6f1-43f81f3e1677
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:39:49.609000+00:00
-- started: 2026-07-30T12:39:49.718000+00:00
-- ended: 2026-07-30T12:39:49.930000+00:00


SELECT Reporting_Date d, Country, SUM(Daily_Spend) sp, SUM(Daily_New_Users) nu, MAX(Daily_CAC) cac
FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
WHERE Plan_Name='PD4988PTAA' AND Cohort='7K_30D' AND `Table`='Regular' AND BC=0
GROUP BY 1,2 ORDER BY d DESC LIMIT 6
