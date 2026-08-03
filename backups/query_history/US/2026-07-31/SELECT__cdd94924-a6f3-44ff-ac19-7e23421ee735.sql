-- job_id: cdd94924-a6f3-44ff-ac19-7e23421ee735
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:20:11.447000+00:00
-- started: 2026-07-31T13:20:11.560000+00:00
-- ended: 2026-07-31T13:20:11.661000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
