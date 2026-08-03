-- job_id: d4462a28-a96c-40bd-841a-ca307a1faf50
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:53:02.482000+00:00
-- started: 2026-07-30T10:53:02.644000+00:00
-- ended: 2026-07-30T10:53:02.828000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
