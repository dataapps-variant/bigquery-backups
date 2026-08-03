-- job_id: 7ae5a621-9158-418d-9436-87d2d97fbd8c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:36:24.082000+00:00
-- started: 2026-07-29T11:36:24.153000+00:00
-- ended: 2026-07-29T11:36:24.239000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
