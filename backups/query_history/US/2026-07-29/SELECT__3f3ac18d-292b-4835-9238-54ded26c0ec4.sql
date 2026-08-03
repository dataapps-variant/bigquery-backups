-- job_id: 3f3ac18d-292b-4835-9238-54ded26c0ec4
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:37:02.561000+00:00
-- started: 2026-07-29T17:37:02.686000+00:00
-- ended: 2026-07-29T17:37:02.810000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
