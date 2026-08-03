-- job_id: 29551c2d-fd7f-480f-94f9-9ecc39dc6b41
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:53:01.348000+00:00
-- started: 2026-07-30T10:53:01.448000+00:00
-- ended: 2026-07-30T10:53:01.554000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
