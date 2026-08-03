-- job_id: 88145636-0188-43e8-8408-7cf728b709f1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:50:05.494000+00:00
-- started: 2026-07-31T09:50:05.606000+00:00
-- ended: 2026-07-31T09:50:05.814000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
