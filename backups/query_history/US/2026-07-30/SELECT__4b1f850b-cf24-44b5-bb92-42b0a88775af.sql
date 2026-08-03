-- job_id: 4b1f850b-cf24-44b5-bb92-42b0a88775af
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:05:14.389000+00:00
-- started: 2026-07-30T13:05:14.519000+00:00
-- ended: 2026-07-30T13:05:14.643000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
