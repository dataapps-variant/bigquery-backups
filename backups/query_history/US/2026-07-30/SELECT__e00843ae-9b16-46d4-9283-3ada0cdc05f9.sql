-- job_id: e00843ae-9b16-46d4-9283-3ada0cdc05f9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:46.877000+00:00
-- started: 2026-07-30T14:50:46.991000+00:00
-- ended: 2026-07-30T14:50:47.085000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
