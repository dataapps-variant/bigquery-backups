-- job_id: 355da821-9160-464f-b957-380fd085d50f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:35:10.251000+00:00
-- started: 2026-07-29T11:35:10.360000+00:00
-- ended: 2026-07-29T11:35:10.446000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
