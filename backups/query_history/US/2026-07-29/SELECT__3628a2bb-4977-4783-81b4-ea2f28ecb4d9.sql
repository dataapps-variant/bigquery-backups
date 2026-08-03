-- job_id: 3628a2bb-4977-4783-81b4-ea2f28ecb4d9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:37:21.931000+00:00
-- started: 2026-07-29T17:37:22.027000+00:00
-- ended: 2026-07-29T17:37:22.149000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
