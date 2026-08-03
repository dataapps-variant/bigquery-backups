-- job_id: f1870a63-df73-409c-86f9-0a856d21a9b7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:59:56.973000+00:00
-- started: 2026-07-30T12:59:57.071000+00:00
-- ended: 2026-07-30T12:59:57.198000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
