-- job_id: script_job_68b9119f72f10ac840b21fe68e526492_1
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:39:30.852000+00:00
-- started: 2026-07-28T14:39:30.867000+00:00
-- ended: 2026-07-28T14:39:30.997000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    FORMAT(
      "COUNT(DISTINCT CASE WHEN FORMAT_DATE('%%Y-%%m', Date_of_Sale) = '%s' THEN Updated_Cust_ID END) AS %s",
      FORMAT_DATE('%Y-%m', m),
      FORMAT_DATE('`%b_%Y`', m)
    ),
    ',\n    '
  )
  FROM UNNEST(months_array) AS m
)).*;
