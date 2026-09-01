CREATE OR REPLACE TABLE `variant-finance-data-project.LMC.RT_spend_data` AS

SELECT 
  -- AdNetworkCode: Concatenation of Excel serial number + App_name + Zero-padded Channel_code + Country
  CONCAT(
    -- Convert date to first day of month, then to Excel serial number (days since 1900-01-01)
    CAST(DATE_DIFF(DATE_TRUNC(Date, MONTH), DATE('1900-01-01'), DAY) + 2 AS STRING),
    -- App name as-is
    App_name,
    -- Channel code zero-padded to 2 digits
    LPAD(CAST(Channel_code AS STRING), 2, '0'),
    -- Country as-is
    Country
  ) AS AdNetworkCode,
  
  -- Sum of allocated spend for each unique AdNetworkCode
  SUM(allocated_spend) AS Spent_Amount

FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`

WHERE App_Name = 'RT'
-- Group by the constructed AdNetworkCode
GROUP BY AdNetworkCode

-- Order by AdNetworkCode for better readability
ORDER BY AdNetworkCode;
