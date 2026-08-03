-- job_id: 99f70612-7b07-460d-a655-65cc3e067875
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:44:06.794000+00:00
-- started: 2026-07-31T12:44:06.933000+00:00
-- ended: 2026-07-31T12:44:07.145000+00:00

SELECT MAX(Reporting_Date) mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort='7K_30D' AND `Table`='Regular'
