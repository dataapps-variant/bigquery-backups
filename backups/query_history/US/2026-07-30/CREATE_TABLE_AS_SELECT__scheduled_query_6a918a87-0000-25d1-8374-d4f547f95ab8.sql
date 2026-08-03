-- job_id: scheduled_query_6a918a87-0000-25d1-8374-d4f547f95ab8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T08:00:03.686000+00:00
-- started: 2026-07-30T08:00:04.363000+00:00
-- ended: 2026-07-30T08:00:05.464000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.R100.MB_New_Users` AS

WITH Base AS (
  SELECT
    FORMAT_DATE('%m/%d/%Y', Date_of_Sale) AS Date_of_Sale,
    Product_Name_Final AS Plan_Name,
    COUNT(DISTINCT Updated_Cust_ID) AS User_Count
  FROM
    `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE
    App_Name = 'MB'
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR
      (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY
    Date_of_Sale,
    Product_Name_Final
),

ProductMap AS (
  SELECT
    Concat,
    Updated_Concat
  FROM
    `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name`
)

SELECT
  b.Date_of_Sale,
  COALESCE(m.Updated_Concat, b.Plan_Name) AS Plan_Name,
  SUM(b.User_Count) AS User_Count
FROM
  Base b
LEFT JOIN
  ProductMap m ON b.Plan_Name = m.Concat
GROUP BY
  b.Date_of_Sale,
  COALESCE(m.Updated_Concat, b.Plan_Name)
ORDER BY
  b.Date_of_Sale
