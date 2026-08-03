-- job_id: 1cbe59ab-d2fa-4fd8-8a02-da761f70e21a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:39:01.183000+00:00
-- started: 2026-07-30T12:39:01.283000+00:00
-- ended: 2026-07-30T12:39:01.513000+00:00


SELECT Reporting_Date d, SUM(Daily_Spend) sp, SUM(Daily_New_Users) nu, MAX(Daily_CAC) cac
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Plan_Name='PD4988ST' AND Spend_Country_Code_AFID='US'
 AND Cohort='7K_30D' AND `Table`='Regular' AND BC=0 GROUP BY 1 ORDER BY d DESC LIMIT 10
