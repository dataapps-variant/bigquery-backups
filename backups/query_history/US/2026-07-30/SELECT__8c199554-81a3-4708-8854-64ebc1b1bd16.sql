-- job_id: 8c199554-81a3-4708-8854-64ebc1b1bd16
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:53:38.711000+00:00
-- started: 2026-07-30T13:53:38.825000+00:00
-- ended: 2026-07-30T13:53:38.953000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
