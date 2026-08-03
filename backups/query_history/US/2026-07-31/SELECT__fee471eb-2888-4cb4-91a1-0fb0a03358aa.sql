-- job_id: fee471eb-2888-4cb4-91a1-0fb0a03358aa
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:50:01.206000+00:00
-- started: 2026-07-31T09:50:01.378000+00:00
-- ended: 2026-07-31T09:50:01.484000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
