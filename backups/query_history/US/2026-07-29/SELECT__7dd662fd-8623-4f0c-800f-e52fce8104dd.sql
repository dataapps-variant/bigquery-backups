-- job_id: 7dd662fd-8623-4f0c-800f-e52fce8104dd
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:21:45.246000+00:00
-- started: 2026-07-29T11:21:45.345000+00:00
-- ended: 2026-07-29T11:21:45.556000+00:00


WITH m AS (SELECT Report_date d, Billing_Cycle bc, Product_Name_Final p, Spend_Country_Code_AFID cy,
                  SUM(SS_Users) ss, SUM(T7D_Users) t7
           FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
           WHERE Report_date=(SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`) GROUP BY 1,2,3,4),
     f AS (SELECT Reporting_Date d, BC bc, Plan_Name p, Spend_Country_Code_AFID cy,
                  SUM(Single_Sale) sale, SUM(T7D_New_Users) t7n, SUM(T7D_Daily_SS_Users) t7ss
           FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
           WHERE Cohort='7K_30D' AND `Table`='Regular'
             AND Reporting_Date=(SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`) GROUP BY 1,2,3,4)
SELECT
  COUNTIF(m.ss>0) ss_nonzero,
  COUNTIF(m.ss>0 AND m.ss=f.sale) ss_eq_sale,
  COUNTIF(m.ss>0 AND m.ss=f.t7ss) ss_eq_t7ss,
  ROUND(CORR(m.ss, f.sale),4) corr_ss_sale,
  ROUND(CORR(m.ss, f.t7ss),4) corr_ss_t7ss,
  COUNTIF(m.t7>0) t7_nonzero,
  COUNTIF(m.t7>0 AND m.t7=f.t7n) t7_eq,
  ROUND(CORR(m.t7, f.t7n),4) corr_t7
FROM m JOIN f USING (d,bc,p,cy)
