-- job_id: f447906e-fc6a-476a-b336-1d0eced756ef
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:36:46.662000+00:00
-- started: 2026-07-30T12:36:46.764000+00:00
-- ended: 2026-07-30T12:36:46.962000+00:00


SELECT Plan_Name, Cohort, `Table` AS t, BC, COUNT(*) n,
       SUM(Daily_Spend) sp, SUM(Daily_New_Users) nu,
       COUNTIF(Daily_CAC IS NOT NULL) cac_nn, SUM(Daily_CAC) cac,
       MIN(Reporting_Date) mn, MAX(Reporting_Date) mx
FROM `variant-finance-data-project.ICARUS_Multi.Final_Table` WHERE UPPER(Plan_Name) LIKE '%4988PTAA%' AND Cohort='7K_30D' AND `Table`='Regular' AND BC IN (0,4)
GROUP BY 1,2,3,4 ORDER BY 4
