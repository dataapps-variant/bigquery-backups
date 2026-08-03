-- job_id: e5e84efa-0042-422c-9977-161da97288b0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:36:09.664000+00:00
-- started: 2026-07-31T15:36:09.770000+00:00
-- ended: 2026-07-31T15:36:10.129000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
