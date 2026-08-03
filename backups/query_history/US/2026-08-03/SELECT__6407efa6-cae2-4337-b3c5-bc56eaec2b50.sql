-- job_id: 6407efa6-cae2-4337-b3c5-bc56eaec2b50
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T12:50:29.344000+00:00
-- started: 2026-08-03T12:50:29.439000+00:00
-- ended: 2026-08-03T12:50:29.633000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
