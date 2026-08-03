-- job_id: 0f4c0e3a-d5bd-4563-af0b-b2164ede2fbd
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:09:06.204000+00:00
-- started: 2026-07-29T11:09:06.320000+00:00
-- ended: 2026-07-29T11:09:06.518000+00:00

SELECT a,c FROM (SELECT App_Name a, Spend_Country_Code_AFID c, SUM(Subscription_users) cs
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE App_Name IS NOT NULL AND Spend_Country_Code_AFID IS NOT NULL
 AND Report_date=(SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`) GROUP BY a,c) ORDER BY a, cs DESC, c
