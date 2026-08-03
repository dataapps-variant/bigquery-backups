-- job_id: 6d0b0131-c979-4829-a3fe-073f37b6ce8a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:01:47.760000+00:00
-- started: 2026-07-29T12:01:47.851000+00:00
-- ended: 2026-07-29T12:01:48.076000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
