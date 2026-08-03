-- job_id: d7608a45-6b95-403e-83f2-32880da83cbb
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T13:02:10.977000+00:00
-- started: 2026-08-03T13:02:11.077000+00:00
-- ended: 2026-08-03T13:02:11.219000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
