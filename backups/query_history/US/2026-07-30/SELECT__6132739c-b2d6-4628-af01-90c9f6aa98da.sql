-- job_id: 6132739c-b2d6-4628-af01-90c9f6aa98da
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:59:58.717000+00:00
-- started: 2026-07-30T12:59:58.808000+00:00
-- ended: 2026-07-30T12:59:58.910000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
