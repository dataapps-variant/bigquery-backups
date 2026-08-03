-- job_id: f075d290-aabf-4502-8e3c-b201b105ac3d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:59.072000+00:00
-- started: 2026-07-31T10:51:59.330000+00:00
-- ended: 2026-07-31T10:51:59.434000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
