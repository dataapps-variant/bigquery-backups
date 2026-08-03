-- job_id: 316c4062-13c6-4168-b963-b7efc97b0659
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:33:51.365000+00:00
-- started: 2026-07-29T11:33:51.464000+00:00
-- ended: 2026-07-29T11:33:51.972000+00:00


SELECT 'MAIN' src, COUNT(*) n,
  COUNTIF(Churn_rate IS NULL) churn_null, COUNTIF(Refund_ratio IS NULL) refund_null,
  COUNTIF(Net_LTV_Discounted IS NULL) ltv_null
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Billing_Cycle=4 AND Report_date BETWEEN '2025-01-01' AND '2026-07-29'
  AND CONCAT(Product_Name_Final,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT2788YT|CA','AT1995YT|US','AT1995YT|CA','CL2995ST|US','CL2995ST|CA','CL2788ST|US','CL2788ST|CA')
UNION ALL
SELECT 'FINAL', COUNT(*),
  COUNTIF(Churn_Rate IS NULL), COUNTIF(Refund_Rate IS NULL), COUNTIF(Net_LTV_Discounted IS NULL)
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=4 AND Reporting_Date BETWEEN '2025-01-01' AND '2026-07-29'
  AND CONCAT(Plan_Name,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT2788YT|CA','AT1995YT|US','AT1995YT|CA','CL2995ST|US','CL2995ST|CA','CL2788ST|US','CL2788ST|CA')
