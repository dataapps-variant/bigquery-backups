-- job_id: 0edac448-6027-47b5-9c4a-39662ade29c2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:36:48.350000+00:00
-- started: 2026-07-30T12:36:48.448000+00:00
-- ended: 2026-07-30T12:36:48.977000+00:00


SELECT Reporting_Date, Subscriptions, Rebills, Single_Sale, Recent_CAC, T30D_New_Users,
       Daily_Spend, Daily_New_Users, Daily_CAC, Net_LTV_Discounted, Net_ARPU_Discounted
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Plan_Name='PD4988PTAA' AND Spend_Country_Code_AFID='US'
 AND Cohort='7K_30D' AND `Table`='Regular' AND BC=0
ORDER BY Reporting_Date DESC LIMIT 6
