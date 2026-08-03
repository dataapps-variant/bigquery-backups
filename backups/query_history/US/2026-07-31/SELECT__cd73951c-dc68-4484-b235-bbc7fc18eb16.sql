-- job_id: cd73951c-dc68-4484-b235-bbc7fc18eb16
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T11:20:02.926000+00:00
-- started: 2026-07-31T11:20:03.045000+00:00
-- ended: 2026-07-31T11:20:03.675000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
