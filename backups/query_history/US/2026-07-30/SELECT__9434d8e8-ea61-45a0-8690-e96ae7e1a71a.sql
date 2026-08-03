-- job_id: 9434d8e8-ea61-45a0-8690-e96ae7e1a71a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:35:41.127000+00:00
-- started: 2026-07-30T12:35:41.277000+00:00
-- ended: 2026-07-30T12:35:41.515000+00:00


SELECT Plan_Name, Product_SCA, Spend_Country_Code_AFID AS cty, BC,
       COUNT(*) n,
       COUNTIF(Daily_Spend IS NOT NULL) sp_nn, SUM(Daily_Spend) sp,
       COUNTIF(Daily_CAC IS NOT NULL) cac_nn, SUM(Daily_CAC) cac,
       COUNTIF(Daily_New_Users IS NOT NULL) nu_nn, SUM(Daily_New_Users) nu
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
WHERE UPPER(Plan_Name) LIKE '%4988PTAA%' AND Cohort='7K_30D' AND `Table`='Regular'
  AND BC IN (0,4)
GROUP BY 1,2,3,4 ORDER BY 1,3,4 LIMIT 40
