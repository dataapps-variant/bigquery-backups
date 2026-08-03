-- job_id: f887bf64-5f60-40c4-a2b3-b6b3d148d1db
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:34:29.992000+00:00
-- started: 2026-07-29T11:34:30.112000+00:00
-- ended: 2026-07-29T11:34:30.246000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
