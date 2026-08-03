-- job_id: ecde6354-d6f1-4292-ab43-02805dbb2a8c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:53:48.025000+00:00
-- started: 2026-07-30T13:53:48.131000+00:00
-- ended: 2026-07-30T13:53:48.239000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL
