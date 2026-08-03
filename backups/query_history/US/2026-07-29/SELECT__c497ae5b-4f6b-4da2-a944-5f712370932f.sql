-- job_id: c497ae5b-4f6b-4da2-a944-5f712370932f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:03:57.836000+00:00
-- started: 2026-07-29T12:03:57.911000+00:00
-- ended: 2026-07-29T12:03:58.023000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
