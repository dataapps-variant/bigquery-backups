-- job_id: 01ada19e-2450-41bb-87e5-aaa9609484b7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:41:11.934000+00:00
-- started: 2026-07-30T12:41:12.054000+00:00
-- ended: 2026-07-30T12:41:12.293000+00:00


WITH p AS (SELECT App_Name a, SUM(Daily_Spend) plan_sp FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
  WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=0 AND Reporting_Date >= DATE_SUB(DATE '2026-07-30', INTERVAL 30 DAY) GROUP BY 1),
ap AS (SELECT App_Name a, SUM(Daily_Allocated_Spend) app_sp FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level`
  WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=0 AND Reporting_Date >= DATE_SUB(DATE '2026-07-30', INTERVAL 30 DAY) GROUP BY 1)
SELECT a, ROUND(plan_sp) plan_level, ROUND(app_sp) app_level, ROUND(100*plan_sp/NULLIF(app_sp,0),1) pct
FROM ap LEFT JOIN p USING(a) ORDER BY app_sp DESC
