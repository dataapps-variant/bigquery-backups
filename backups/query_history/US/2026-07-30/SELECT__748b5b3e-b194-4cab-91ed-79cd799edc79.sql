-- job_id: 748b5b3e-b194-4cab-91ed-79cd799edc79
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:38:59.334000+00:00
-- started: 2026-07-30T12:38:59.459000+00:00
-- ended: 2026-07-30T12:38:59.665000+00:00


SELECT Spend_Country_Code_AFID cty, MIN(Reporting_Date) mn, MAX(Reporting_Date) mx, COUNT(*) n, SUM(Daily_Spend) sp
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Plan_Name='PD4988ST' AND Cohort='7K_30D' AND `Table`='Regular' AND BC=0
  AND Daily_Spend > 0 GROUP BY 1 ORDER BY sp DESC LIMIT 10
