-- job_id: 889e6bd0-f237-45d1-af64-c14f7555aeea
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:08:46.840000+00:00
-- started: 2026-07-30T09:08:46.940000+00:00
-- ended: 2026-07-30T09:08:47.167000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
