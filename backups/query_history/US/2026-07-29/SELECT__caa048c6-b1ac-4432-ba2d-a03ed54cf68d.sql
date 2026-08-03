-- job_id: caa048c6-b1ac-4432-ba2d-a03ed54cf68d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:51:31.035000+00:00
-- started: 2026-07-29T11:51:31.231000+00:00
-- ended: 2026-07-29T11:51:31.314000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
