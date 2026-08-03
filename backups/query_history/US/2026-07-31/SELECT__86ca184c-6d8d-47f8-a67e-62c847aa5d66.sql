-- job_id: 86ca184c-6d8d-47f8-a67e-62c847aa5d66
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:44:05.046000+00:00
-- started: 2026-07-31T12:44:05.170000+00:00
-- ended: 2026-07-31T12:44:05.367000+00:00

SELECT MAX(Reporting_Date) mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' AND `Table`='Regular'
