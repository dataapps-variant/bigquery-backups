-- job_id: c7337967-b63f-4552-bdf2-84829bdd1ef8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:35:13.876000+00:00
-- started: 2026-07-29T11:35:13.982000+00:00
-- ended: 2026-07-29T11:35:14.184000+00:00


WITH m AS (SELECT Report_date d, Product_Name_Final p, Spend_Country_Code_AFID cy,
   Net_LTV_Discounted lt, Net_ARPU_Discounted ar
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE Billing_Cycle=4 AND Report_date BETWEEN '2025-01-01' AND '2026-07-29'
  AND CONCAT(Product_Name_Final,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT2788YT|CA','AT1995YT|US','AT1995YT|CA','CL2995ST|US','CL2995ST|CA','CL2788ST|US','CL2788ST|CA')),
f AS (SELECT Reporting_Date d, Plan_Name p, Spend_Country_Code_AFID cy,
   Net_LTV_Discounted lt, Net_ARPU_Discounted ar
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=4
  AND Reporting_Date BETWEEN '2025-01-01' AND '2026-07-29'
  AND CONCAT(Plan_Name,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT2788YT|CA','AT1995YT|US','AT1995YT|CA','CL2995ST|US','CL2995ST|CA','CL2788ST|US','CL2788ST|CA'))
SELECT
 COUNTIF(m.lt IS NOT NULL) main_lt_rows,
 COUNTIF(ABS(m.lt-m.ar)<1e-9) main_lt_equals_arpu,
 COUNTIF(ABS(f.lt-f.ar)<1e-9) final_lt_equals_arpu,
 ROUND(AVG(m.lt),3) main_avg_lt, ROUND(AVG(f.lt),3) final_avg_lt,
 ROUND(AVG(m.ar),3) main_avg_arpu, ROUND(AVG(f.ar),3) final_avg_arpu
FROM m JOIN f USING (d,p,cy)
