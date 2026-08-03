-- job_id: a8274704-f577-4dd4-aef8-cad948b4e4b8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:52:15.102000+00:00
-- started: 2026-07-31T10:52:15.206000+00:00
-- ended: 2026-07-31T10:52:15.295000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
