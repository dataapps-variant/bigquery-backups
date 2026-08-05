DECLARE start_date DATE DEFAULT '2025-01-01';
DECLARE end_date DATE DEFAULT '2025-12-31';
DECLARE pivot_columns STRING;
DECLARE query STRING;

-- Dynamically build the monthly CASE columns
SET pivot_columns = (
  SELECT STRING_AGG(
    FORMAT(
      "SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '%s' THEN allocated_spend ELSE 0 END) AS `%s`",
      FORMAT_DATE('%Y-%m-%d', month_start),
      FORMAT_DATE('%b_%Y', month_start)
    ),
    ',\n  '
    ORDER BY month_start
  )
  FROM UNNEST(
    GENERATE_DATE_ARRAY(
      DATE_TRUNC(start_date, MONTH),
      DATE_TRUNC(end_date, MONTH),
      INTERVAL 1 MONTH
    )
  ) AS month_start
);

-- Assemble and execute the full query
SET query = FORMAT("""
  SELECT
    App_Name,
    Channel_name,
    Channel_code,
    %s
  FROM
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE
    Date BETWEEN '%s' AND '%s'
  GROUP BY
    App_Name, Channel_name, Channel_code
  ORDER BY
    App_Name, Channel_name, Channel_code
""", pivot_columns, CAST(start_date AS STRING), CAST(end_date AS STRING));

EXECUTE IMMEDIATE query;
