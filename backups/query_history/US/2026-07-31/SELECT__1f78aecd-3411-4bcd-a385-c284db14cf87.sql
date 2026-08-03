-- job_id: 1f78aecd-3411-4bcd-a385-c284db14cf87
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:32.492000+00:00
-- started: 2026-07-31T10:51:32.601000+00:00
-- ended: 2026-07-31T10:51:32.696000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
