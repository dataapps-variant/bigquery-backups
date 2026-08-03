-- job_id: job_fS5YwLCHTpF39l64u592HpSEykiZ
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-29T17:19:54.919000+00:00
-- started: 2026-07-29T17:19:54.963000+00:00
-- ended: 2026-07-29T17:20:06.691000+00:00

DECLARE start_date DATE DEFAULT '2025-01-01';
DECLARE end_date DATE DEFAULT '2026-06-30';
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
    ',\n    '
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
  CREATE OR REPLACE TABLE `variant-finance-data-project.Ad_spend_data.Spend_Matching_Channel` AS
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
