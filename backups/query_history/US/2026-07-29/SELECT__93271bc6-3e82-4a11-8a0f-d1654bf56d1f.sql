-- job_id: 93271bc6-3e82-4a11-8a0f-d1654bf56d1f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:34:33.995000+00:00
-- started: 2026-07-29T11:34:34.147000+00:00
-- ended: 2026-07-29T11:34:34.401000+00:00


WITH m AS (SELECT Report_date d, Product_Name_Final p, Spend_Country_Code_AFID cy,
  Churn_rate ch, Refund_ratio rf, Net_LTV_Discounted lt
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
 WHERE Billing_Cycle=4 AND Report_date BETWEEN '2025-01-01' AND '2026-07-29'
   AND CONCAT(Product_Name_Final,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT2788YT|CA','AT1995YT|US','AT1995YT|CA','CL2995ST|US','CL2995ST|CA','CL2788ST|US','CL2788ST|CA')),
f AS (SELECT Reporting_Date d, Plan_Name p, Spend_Country_Code_AFID cy,
  Churn_Rate ch, Refund_Rate rf, Net_LTV_Discounted lt
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
 WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=4 AND Reporting_Date BETWEEN '2025-01-01' AND '2026-07-29'
   AND CONCAT(Plan_Name,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT2788YT|CA','AT1995YT|US','AT1995YT|CA','CL2995ST|US','CL2995ST|CA','CL2788ST|US','CL2788ST|CA'))
SELECT
 COUNTIF(m.ch IS NOT NULL AND f.ch IS NOT NULL) ch_both,
 COUNTIF(m.ch IS NOT NULL AND f.ch IS NOT NULL AND ABS(m.ch-f.ch)<1e-9) ch_eq,
 COUNTIF(m.rf IS NOT NULL AND f.rf IS NOT NULL) rf_both,
 COUNTIF(m.rf IS NOT NULL AND f.rf IS NOT NULL AND ABS(m.rf-f.rf)<1e-9) rf_eq,
 COUNTIF(m.lt IS NOT NULL AND f.lt IS NOT NULL) lt_both,
 COUNTIF(m.lt IS NOT NULL AND f.lt IS NOT NULL AND ABS(m.lt-f.lt)<1e-9) lt_eq,
 COUNTIF(m.rf IS NOT NULL AND f.rf IS NULL AND m.rf=0) rf_mainzero_finalnull
FROM m JOIN f USING (d,p,cy)
