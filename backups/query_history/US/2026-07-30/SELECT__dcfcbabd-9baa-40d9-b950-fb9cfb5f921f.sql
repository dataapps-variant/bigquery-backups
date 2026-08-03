-- job_id: dcfcbabd-9baa-40d9-b950-fb9cfb5f921f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:45.786000+00:00
-- started: 2026-07-30T14:50:45.883000+00:00
-- ended: 2026-07-30T14:50:46.005000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
