-- job_id: 7fd75f37-88e0-4b74-8f2c-b066923879ad
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:50.522000+00:00
-- started: 2026-07-30T14:50:50.633000+00:00
-- ended: 2026-07-30T14:50:50.757000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
