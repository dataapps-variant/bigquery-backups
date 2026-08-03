-- job_id: e7f67d5a-dbe8-4f0d-a9ea-20d712f9fe10
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:19.245000+00:00
-- started: 2026-07-31T10:51:19.372000+00:00
-- ended: 2026-07-31T10:51:19.521000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
