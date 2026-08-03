-- job_id: a02e3b26-2d46-49cb-8d43-be74ff118e79
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:33:04.780000+00:00
-- started: 2026-07-29T11:33:04.902000+00:00
-- ended: 2026-07-29T11:33:05.102000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
