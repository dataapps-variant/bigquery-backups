-- job_id: script_job_ffa2023e27db400625606719ec4ebef3_3
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T09:32:17.823000+00:00
-- started: 2026-07-30T09:32:18.144000+00:00
-- ended: 2026-07-30T09:32:19.418000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Country_List` AS
  WITH base AS (
    SELECT
      CASE
        WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
        WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
        ELSE App_Name
      END AS App_Name,
      Spend_Country_Code_AFID,
      COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-04' THEN Updated_Cust_ID END) AS `Apr_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-05' THEN Updated_Cust_ID END) AS `May_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-06' THEN Updated_Cust_ID END) AS `Jun_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-07' THEN Updated_Cust_ID END) AS `Jul_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-08' THEN Updated_Cust_ID END) AS `Aug_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-09' THEN Updated_Cust_ID END) AS `Sep_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-10' THEN Updated_Cust_ID END) AS `Oct_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-11' THEN Updated_Cust_ID END) AS `Nov_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2025-12' THEN Updated_Cust_ID END) AS `Dec_2025`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2026-01' THEN Updated_Cust_ID END) AS `Jan_2026`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2026-02' THEN Updated_Cust_ID END) AS `Feb_2026`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2026-03' THEN Updated_Cust_ID END) AS `Mar_2026`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2026-04' THEN Updated_Cust_ID END) AS `Apr_2026`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2026-05' THEN Updated_Cust_ID END) AS `May_2026`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2026-06' THEN Updated_Cust_ID END) AS `Jun_2026`,
    COUNT(DISTINCT CASE WHEN FORMAT_DATE('%Y-%m', Date_of_Sale) = '2026-07' THEN Updated_Cust_ID END) AS `Jul_2026`
    FROM
      `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE
      Date_of_Sale >= '2025-04-01'
      AND Date_of_Sale < '2026-07-31'
      AND Spend_Country_Code_AFID IS NOT NULL
      AND (
        (RIGHT(Product_Name_Final, 2) = 'NT' AND Billing_Cycle_Updated = 1)
        OR
        (RIGHT(Product_Name_Final, 2) != 'NT' AND Billing_Cycle_Updated = 0)
      )
    GROUP BY
      App_Name, Spend_Country_Code_AFID
  )
  SELECT
    *,
    CASE WHEN (`May_2026` + `Jun_2026` + `Jul_2026`) > 50 THEN 'Yes' ELSE 'No' END AS Last_3_Months_Over_50
  FROM base
  ORDER BY App_Name, Spend_Country_Code_AFID
