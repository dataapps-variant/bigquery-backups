-- job_id: 2cfc2f48-77e6-481c-a375-ea939c353919
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:44:54.725000+00:00
-- started: 2026-07-31T13:44:54.931000+00:00
-- ended: 2026-07-31T13:44:55.045000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
