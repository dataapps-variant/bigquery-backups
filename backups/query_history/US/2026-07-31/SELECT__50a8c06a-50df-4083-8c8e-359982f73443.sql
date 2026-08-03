-- job_id: 50a8c06a-50df-4083-8c8e-359982f73443
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:47:06.760000+00:00
-- started: 2026-07-31T12:47:06.859000+00:00
-- ended: 2026-07-31T12:47:07.066000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
