-- job_id: f0cd2468-54b3-47c7-a04e-91864dcfba83
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:39:47.637000+00:00
-- started: 2026-07-30T12:39:47.755000+00:00
-- ended: 2026-07-30T12:39:47.968000+00:00


SELECT Reporting_Date d, SUM(Daily_Allocated_Spend) das, SUM(Recent_Spend) rs, SUM(Daily_New_Users) dnu, MAX(Daily_CAC) dcac, MAX(Recent_CAC) rcac
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE App_Name='PD' AND Spend_Country_Code_AFID='US'
 AND Cohort='7K_30D' AND `Table`='Regular' AND BC=0 GROUP BY 1 ORDER BY d DESC LIMIT 5
