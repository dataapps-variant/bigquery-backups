-- job_id: 3f97771e-371b-4beb-862a-814f1c227cb6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:34.118000+00:00
-- started: 2026-07-31T10:51:34.381000+00:00
-- ended: 2026-07-31T10:51:34.470000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
