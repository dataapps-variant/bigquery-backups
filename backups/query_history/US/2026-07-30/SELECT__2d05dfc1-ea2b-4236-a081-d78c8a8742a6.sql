-- job_id: 2d05dfc1-ea2b-4236-a081-d78c8a8742a6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:02:40.993000+00:00
-- started: 2026-07-30T13:02:41.119000+00:00
-- ended: 2026-07-30T13:02:41.322000+00:00


WITH uc AS (
  SELECT Report_Date d, SUM(BC_New_Users) uc_total
  FROM `variant-finance-data-project.ICARUS_Multi.User_Count`
  WHERE App_Name='PD' AND Billing_Cycle_Updated=4 AND Report_Date >= DATE '2026-07-20' GROUP BY 1),
fin AS (
  SELECT Reporting_Date d,
     SUM(IF(Spend_Country_Code_AFID='US', Rebills, 0)) us,
     SUM(IF(Spend_Country_Code_AFID='CA', Rebills, 0)) ca,
     SUM(IF(Spend_Country_Code_AFID='AU', Rebills, 0)) au,
     SUM(Rebills) all_cty
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level`
  WHERE App_Name='PD' AND BC=4 AND Cohort='7K_30D' AND `Table`='Regular'
    AND Reporting_Date >= DATE '2026-07-20' GROUP BY 1)
SELECT * FROM uc JOIN fin USING(d) ORDER BY d DESC
