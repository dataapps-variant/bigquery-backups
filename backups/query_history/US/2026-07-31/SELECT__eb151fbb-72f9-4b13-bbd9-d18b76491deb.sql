-- job_id: eb151fbb-72f9-4b13-bbd9-d18b76491deb
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:42:10.941000+00:00
-- started: 2026-07-31T12:42:11.040000+00:00
-- ended: 2026-07-31T12:42:11.171000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
