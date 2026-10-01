BEGIN
  EXECUTE IMMEDIATE (
    WITH date_bounds AS (
      SELECT
        DATE_SUB(CURRENT_DATE(), INTERVAL 101 DAY) AS min_date
    )
    SELECT FORMAT("""
      CREATE OR REPLACE TABLE `variant-finance-data-project.demo_practise.en_rolling_100_actual_data_new` AS
      WITH start_date AS (
        SELECT MIN(Day_First_Charge_Acquired) AS min_date
        FROM `variant-finance-data-project.R100.EN_new_trailing100`
        WHERE PLAN_NAME = '2788YT'
          AND APP_SHORT_NAME = 'EN'
      ),
      filtered_data AS (
        SELECT
          Day_First_Charge_Acquired,
          Day_Charged,
          BILLING_CYCLE,
          ORDER_COUNT
        FROM `variant-finance-data-project.R100.EN_new_trailing100`
        WHERE CONCAT(APP_SHORT_NAME, PLAN_NAME) = 'EN2788YT'
          AND COHORT_Network_Country_IDs IS NOT NULL
          AND PLAN_NAME IS NOT NULL
      ),
      date_rows AS (
        SELECT day AS row_date
        FROM start_date,
        UNNEST(GENERATE_DATE_ARRAY(
          min_date,
          DATE_ADD(CURRENT_DATE(), INTERVAL 100 DAY),
          INTERVAL 1 DAY
        )) AS day
      ),
      users_agg AS (
        SELECT
          Day_First_Charge_Acquired,
          SUM(CASE WHEN BILLING_CYCLE = 0 THEN ORDER_COUNT ELSE 0 END) AS users_actual
        FROM filtered_data
        GROUP BY Day_First_Charge_Acquired
      ),
      per_day_stats AS (
        SELECT
          Day_Charged,
          SUM(IF(BILLING_CYCLE = 0, ORDER_COUNT, 0)) AS bc0_users,
          SUM(ORDER_COUNT) AS total_users
        FROM filtered_data
        GROUP BY Day_Charged
      ),
      main_matrix AS (
        SELECT
          1 AS section,
          UNIX_DATE(r.row_date) AS sort_order,
          FORMAT_DATE('%%m/%%d/%%Y', r.row_date) AS GROSS_RETENTION,
          CAST(
            CASE
              WHEN r.row_date < CURRENT_DATE() THEN IFNULL(u.users_actual, 0)
              ELSE NULL
            END AS STRING
          ) AS Users,
          %s
        FROM date_rows r
        LEFT JOIN users_agg u
          ON u.Day_First_Charge_Acquired = r.row_date
        LEFT JOIN filtered_data f
          ON f.Day_First_Charge_Acquired = r.row_date
        GROUP BY r.row_date, u.users_actual
      ),
      revenue_rows AS (
        SELECT 2 AS section, 1 AS sort_order,
          'BC0 Users (@ $1.99)' AS GROSS_RETENTION, CAST(NULL AS STRING) AS Users,
          %s
        FROM per_day_stats
        UNION ALL
        SELECT 2 AS section, 2 AS sort_order,
          'Other BC Users (@ $27.88)' AS GROSS_RETENTION, CAST(NULL AS STRING) AS Users,
          %s
        FROM per_day_stats
        UNION ALL
        SELECT 2 AS section, 3 AS sort_order,
          'Total Revenue' AS GROSS_RETENTION, CAST(NULL AS STRING) AS Users,
          %s
        FROM per_day_stats
      ),
      combined AS (
        SELECT * FROM main_matrix
        UNION ALL
        SELECT * FROM revenue_rows
      )
      SELECT * EXCEPT(section, sort_order)
      FROM combined
    """,
    (SELECT CONCAT(
      (SELECT STRING_AGG(
        FORMAT(
          "CAST(SUM(IF(f.Day_Charged = DATE '%s', f.ORDER_COUNT, 0)) AS STRING) AS `%s`",
          FORMAT_DATE('%Y-%m-%d', col_date),
          FORMAT_DATE('_%m_%d_%Y', col_date)
        ),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        min_date,
        DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY),
        INTERVAL 1 DAY
      )) AS col_date),
      ', ',
      (SELECT STRING_AGG(
        FORMAT("CAST(NULL AS STRING) AS `%s`", FORMAT_DATE('_%m_%d_%Y', col_date)),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        CURRENT_DATE(),
        DATE_ADD(CURRENT_DATE(), INTERVAL 100 DAY),
        INTERVAL 1 DAY
      )) AS col_date)
    ) FROM date_bounds),

    (SELECT CONCAT(
      (SELECT STRING_AGG(
        FORMAT(
          "CAST(MAX(IF(Day_Charged = DATE '%s', bc0_users, 0)) AS STRING) AS `%s`",
          FORMAT_DATE('%Y-%m-%d', col_date),
          FORMAT_DATE('_%m_%d_%Y', col_date)
        ),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        min_date,
        DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY),
        INTERVAL 1 DAY
      )) AS col_date),
      ', ',
      (SELECT STRING_AGG(
        FORMAT("CAST(NULL AS STRING) AS `%s`", FORMAT_DATE('_%m_%d_%Y', col_date)),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        CURRENT_DATE(),
        DATE_ADD(CURRENT_DATE(), INTERVAL 100 DAY),
        INTERVAL 1 DAY
      )) AS col_date)
    ) FROM date_bounds),

    (SELECT CONCAT(
      (SELECT STRING_AGG(
        FORMAT(
          "CAST(MAX(IF(Day_Charged = DATE '%s', total_users - bc0_users, 0)) AS STRING) AS `%s`",
          FORMAT_DATE('%Y-%m-%d', col_date),
          FORMAT_DATE('_%m_%d_%Y', col_date)
        ),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        min_date,
        DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY),
        INTERVAL 1 DAY
      )) AS col_date),
      ', ',
      (SELECT STRING_AGG(
        FORMAT("CAST(NULL AS STRING) AS `%s`", FORMAT_DATE('_%m_%d_%Y', col_date)),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        CURRENT_DATE(),
        DATE_ADD(CURRENT_DATE(), INTERVAL 100 DAY),
        INTERVAL 1 DAY
      )) AS col_date)
    ) FROM date_bounds),

    (SELECT CONCAT(
      (SELECT STRING_AGG(
        FORMAT(
          "CAST(ROUND(MAX(IF(Day_Charged = DATE '%s', bc0_users * 1.99 + (total_users - bc0_users) * 27.88, 0)), 2) AS STRING) AS `%s`",
          FORMAT_DATE('%Y-%m-%d', col_date),
          FORMAT_DATE('_%m_%d_%Y', col_date)
        ),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        min_date,
        DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY),
        INTERVAL 1 DAY
      )) AS col_date),
      ', ',
      (SELECT STRING_AGG(
        FORMAT("CAST(NULL AS STRING) AS `%s`", FORMAT_DATE('_%m_%d_%Y', col_date)),
        ', ' ORDER BY col_date ASC
      )
      FROM UNNEST(GENERATE_DATE_ARRAY(
        CURRENT_DATE(),
        DATE_ADD(CURRENT_DATE(), INTERVAL 100 DAY),
        INTERVAL 1 DAY
      )) AS col_date)
    ) FROM date_bounds)
    )
  );

  SELECT *
  FROM `variant-finance-data-project.demo_practise.en_rolling_100_actual_data_new`
  ORDER BY
    CASE
      WHEN REGEXP_CONTAINS(GROSS_RETENTION, r'^\d{2}/\d{2}/\d{4}$') THEN 1
      ELSE 2
    END,
    SAFE.PARSE_DATE('%m/%d/%Y', GROSS_RETENTION);
END;
