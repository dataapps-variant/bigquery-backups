-- job_id: 1ca001b1-c5a2-4e9a-9456-12c8029eaaeb
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:14:22.508000+00:00
-- started: 2026-07-29T13:14:22.609000+00:00
-- ended: 2026-07-29T13:14:22.753000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
