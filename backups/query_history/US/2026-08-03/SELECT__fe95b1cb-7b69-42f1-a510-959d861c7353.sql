-- job_id: fe95b1cb-7b69-42f1-a510-959d861c7353
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:54:51.641000+00:00
-- started: 2026-08-03T12:54:51.791000+00:00
-- ended: 2026-08-03T12:54:52.031000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
