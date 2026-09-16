CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Sticky_Order_Maintenance_AT` AS
SELECT 
  Order_Id,
  last_updated,
  Date_of_Sale,
  Chargeback_Date,
  Hold_Date,
  Void_Date,
  Refund_Date,
  (
    SELECT MAX(date_val) 
    FROM UNNEST([
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', last_updated),
      TIMESTAMP(Date_of_Sale),
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Chargeback_Date),
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Hold_Date),
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Void_Date),
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Refund_Date)
    ]) AS date_val 
    WHERE date_val IS NOT NULL
  ) AS Order_Main_Date
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
