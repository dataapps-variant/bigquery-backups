-- job_id: 5c8c54b8-d892-4110-9a56-b81748f8ec2e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:38:24.380000+00:00
-- started: 2026-07-30T12:38:24.487000+00:00
-- ended: 2026-07-30T12:38:24.726000+00:00


WITH f AS (
  SELECT Reporting_Date d, SUM(Daily_Spend) f_sp, SUM(Daily_New_Users) f_nu, MAX(Daily_CAC) f_cac
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
  WHERE Plan_Name=@p AND Spend_Country_Code_AFID='US' AND Cohort='7K_30D' AND `Table`='Regular' AND BC=0
  GROUP BY 1),
m AS (
  SELECT Report_date d, SUM(Recent_Spend) m_rs, SUM(Recent_Users) m_ru, MAX(Recent_CAC) m_cac,
         SUM(T7D_Spend) m_t7s, SUM(T7D_Users) m_t7u
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
  WHERE Product_Name_Final=@p AND Spend_Country_Code_AFID='US' AND Billing_Cycle=0
  GROUP BY 1)
SELECT * FROM f JOIN m USING(d) ORDER BY d DESC LIMIT 5
