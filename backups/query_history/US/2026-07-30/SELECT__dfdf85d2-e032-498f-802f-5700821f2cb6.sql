-- job_id: dfdf85d2-e032-498f-802f-5700821f2cb6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:35:33.707000+00:00
-- started: 2026-07-30T13:35:33.841000+00:00
-- ended: 2026-07-30T13:35:33.977000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
