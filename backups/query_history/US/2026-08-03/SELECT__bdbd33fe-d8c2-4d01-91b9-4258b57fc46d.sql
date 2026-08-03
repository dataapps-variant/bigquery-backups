-- job_id: bdbd33fe-d8c2-4d01-91b9-4258b57fc46d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T12:50:36.658000+00:00
-- started: 2026-08-03T12:50:36.753000+00:00
-- ended: 2026-08-03T12:50:36.958000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
