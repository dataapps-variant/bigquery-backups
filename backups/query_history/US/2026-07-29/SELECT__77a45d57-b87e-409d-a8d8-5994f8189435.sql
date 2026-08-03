-- job_id: 77a45d57-b87e-409d-a8d8-5994f8189435
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:49:25.112000+00:00
-- started: 2026-07-29T11:49:25.218000+00:00
-- ended: 2026-07-29T11:49:25.344000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
