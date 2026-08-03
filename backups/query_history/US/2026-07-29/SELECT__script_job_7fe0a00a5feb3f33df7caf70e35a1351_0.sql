-- job_id: script_job_7fe0a00a5feb3f33df7caf70e35a1351_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:00:15.934000+00:00
-- started: 2026-07-29T09:00:15.984000+00:00
-- ended: 2026-07-29T09:00:16.906000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(month_quoted ORDER BY yr, mn)
  FROM (
    SELECT DISTINCT
      EXTRACT(YEAR FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)) AS yr,
      EXTRACT(MONTH FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)) AS mn,
      FORMAT("'%s'",
        FORMAT('%d-%d-%d', 1,
          EXTRACT(MONTH FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)),
          EXTRACT(YEAR FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time))
        )
      ) AS month_quoted
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)
          >= TIMESTAMP('2023-01-01')
      AND PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)
          < TIMESTAMP(DATE_TRUNC(CURRENT_DATE(), MONTH))
  )
)).*;
