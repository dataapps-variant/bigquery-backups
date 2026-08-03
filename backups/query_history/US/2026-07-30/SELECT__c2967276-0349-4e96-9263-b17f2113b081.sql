-- job_id: c2967276-0349-4e96-9263-b17f2113b081
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:05:12.624000+00:00
-- started: 2026-07-30T13:05:12.742000+00:00
-- ended: 2026-07-30T13:05:12.853000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
