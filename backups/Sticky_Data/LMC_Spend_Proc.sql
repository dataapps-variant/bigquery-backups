CREATE PROCEDURE `variant-finance-data-project`.Sticky_Data.LMC_Spend_Proc()
BEGIN
DECLARE start_date DATE DEFAULT DATE('2023-01-01');
DECLARE end_date DATE DEFAULT DATE_TRUNC(CURRENT_DATE(), MONTH) - 1;
DECLARE pivot_columns STRING;
DECLARE final_query STRING;

-- Generate dynamic column definitions for each month from start_date to end_date
SET pivot_columns = (
  SELECT STRING_AGG(
    FORMAT(
      "SUM(CASE WHEN EXTRACT(YEAR FROM Date) = %d AND EXTRACT(MONTH FROM Date) = %d THEN allocated_spend ELSE 0 END) AS `%s`",
      EXTRACT(YEAR FROM month_date),
      EXTRACT(MONTH FROM month_date),
      FORMAT_DATE('%d-%m-%Y', month_date)
    ),
    ',\n  '
  ORDER BY month_date)
  FROM UNNEST(GENERATE_DATE_ARRAY(start_date, end_date, INTERVAL 1 MONTH)) AS month_date
);

-- Build the final query
SET final_query = FORMAT("""
CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_Spend` AS
SELECT
  CASE 
    WHEN STARTS_WITH(src.Product_name_Final, 'CT') AND src.Country = 'JP'
      THEN CONCAT(COALESCE(lkp.Updated_Concat, src.Product_name_Final), '-JP')
    WHEN STARTS_WITH(src.Product_name_Final, 'CT')
      THEN CONCAT(COALESCE(lkp.Updated_Concat, src.Product_name_Final), '-Non-JP')
    ELSE COALESCE(lkp.Updated_Concat, src.Product_name_Final)
  END AS Product_name_Final,
  %s
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` src
LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` lkp
  ON src.Product_name_Final = lkp.Concat
WHERE Date < DATE_TRUNC(CURRENT_DATE(), MONTH)
GROUP BY 
  CASE 
    WHEN STARTS_WITH(src.Product_name_Final, 'CT') AND src.Country = 'JP'
      THEN CONCAT(COALESCE(lkp.Updated_Concat, src.Product_name_Final), '-JP')
    WHEN STARTS_WITH(src.Product_name_Final, 'CT')
      THEN CONCAT(COALESCE(lkp.Updated_Concat, src.Product_name_Final), '-Non-JP')
    ELSE COALESCE(lkp.Updated_Concat, src.Product_name_Final)
  END
ORDER BY Product_name_Final
""", pivot_columns);

-- Execute the dynamic query
EXECUTE IMMEDIATE final_query;
END;
