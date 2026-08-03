-- job_id: 0d889eb7-7b62-4adc-ae4d-a811f9c1a279
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T13:02:13.368000+00:00
-- started: 2026-08-03T13:02:13.465000+00:00
-- ended: 2026-08-03T13:02:13.601000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
