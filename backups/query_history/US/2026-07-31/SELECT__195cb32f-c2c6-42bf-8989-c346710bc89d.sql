-- job_id: 195cb32f-c2c6-42bf-8989-c346710bc89d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:37.558000+00:00
-- started: 2026-07-31T10:51:37.659000+00:00
-- ended: 2026-07-31T10:51:37.774000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
