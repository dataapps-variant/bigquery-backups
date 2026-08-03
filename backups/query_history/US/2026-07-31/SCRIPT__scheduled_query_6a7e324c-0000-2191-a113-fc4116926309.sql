-- job_id: scheduled_query_6a7e324c-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-31T08:15:03.801000+00:00
-- started: 2026-07-31T08:15:03.841000+00:00
-- ended: 2026-07-31T08:15:08.890000+00:00

DECLARE month_start DATE DEFAULT DATE '2025-04-01';
DECLARE month_end DATE DEFAULT DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY);
DECLARE months_array ARRAY<DATE>;
DECLARE pivot_columns STRING;
DECLARE last_3_months_expr STRING;
DECLARE query STRING;

SET months_array = GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH);

SET pivot_columns = (
  SELECT STRING_AGG(
    FORMAT(
      "COUNT(DISTINCT CASE WHEN FORMAT_DATE('%%Y-%%m', Date_of_Sale) = '%s' THEN Updated_Cust_ID END) AS %s",
      FORMAT_DATE('%Y-%m', m),
      FORMAT_DATE('`%b_%Y`', m)
    ),
    ',\n    '
  )
  FROM UNNEST(months_array) AS m
);

SET last_3_months_expr = (
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
);

SET query = FORMAT("""
  CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_AFID_List` AS
  WITH base AS (
    SELECT
      CASE
        WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
        WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
        ELSE App_Name
      END AS App_Name,
      AFID,
      %s
    FROM
      `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE
      Date_of_Sale >= '%s'
      AND Date_of_Sale < '%s'
      AND (
        (RIGHT(Product_Name_Final, 2) = 'NT' AND Billing_Cycle_Updated = 1)
        OR
        (RIGHT(Product_Name_Final, 2) != 'NT' AND Billing_Cycle_Updated = 0)
      )
    GROUP BY
      App_Name, AFID, Spend_Country_Code_AFID
  )
  SELECT
    *,
    CASE WHEN %s THEN 'Yes' ELSE 'No' END AS Last_3_Months_Over_50
  FROM base
  ORDER BY App_Name, AFID
""", pivot_columns, CAST(month_start AS STRING), CAST(month_end AS STRING), last_3_months_expr);

EXECUTE IMMEDIATE query;
