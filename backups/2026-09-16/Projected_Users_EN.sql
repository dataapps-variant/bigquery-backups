CREATE OR REPLACE TABLE `variant-finance-data-project.demo_practise.projected_users` AS

WITH users_7 AS (
  SELECT
    Day_First_Charge_Acquired,

    SUM(
      CASE
        WHEN BILLING_CYCLE = 0 THEN ORDER_COUNT
        ELSE 0
      END
    ) AS bc0_users

  FROM `variant-finance-data-project.R100.EN_new_trailing100`

  WHERE CONCAT(APP_SHORT_NAME, PLAN_NAME) = 'EN2788YT'
    AND COHORT_Network_Country_IDs IS NOT NULL
    AND PLAN_NAME IS NOT NULL
    AND Day_First_Charge_Acquired >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
    AND Day_First_Charge_Acquired < CURRENT_DATE()

  GROUP BY Day_First_Charge_Acquired
),

spend_7 AS (
  SELECT
    Day_First_Charge_Acquired,

    SUM(
      CAST(
        REPLACE(
          REPLACE(CAST(SPENT_AMOUNT AS STRING), '$', ''),
          ',',
          ''
        ) AS FLOAT64
      )
    ) AS total_spend

  FROM `variant-finance-data-project.R100.EN_new_trailing100`

  WHERE APP_SHORT_NAME = 'EN'
    AND SPENT_AMOUNT IS NOT NULL
    AND Day_First_Charge_Acquired >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
    AND Day_First_Charge_Acquired < CURRENT_DATE()

  GROUP BY Day_First_Charge_Acquired
),

sow AS (
  SELECT
    day_of_week,

    CAST(
      REPLACE(weight_pct, '%', '') AS FLOAT64
    ) / 100 AS weight

  FROM `variant-finance-data-project.demo_practise.Shape of 4 Weeks Users Curve`

  WHERE Plan_Name = 'EN2788YT'
),

totals AS (
  SELECT
    SUM(s.total_spend) AS sum_spend,

    -- Average spend across full 7 days
    SUM(s.total_spend) / 7 AS avg_spend_7_days,

    SUM(u.bc0_users) AS sum_bc0

  FROM users_7 u

  LEFT JOIN spend_7 s
    ON s.Day_First_Charge_Acquired = u.Day_First_Charge_Acquired
)

SELECT
  u.Day_First_Charge_Acquired AS Day_Charged,

  ROUND(s.total_spend, 2) AS Total_Spend,

  u.bc0_users AS BC0_Users,

  ROUND(sow.weight * 100, 2) AS SOW_Pct,

  -- Avg Spend × SOW% × 7
  ROUND(
    t.avg_spend_7_days * sow.weight * 7,
    2
  ) AS Adjusted_Spend,

  ROUND(
    SAFE_DIVIDE(
      t.sum_spend,
      t.sum_bc0
    ),
    2
  ) AS CAC,

  ROUND(
    SAFE_DIVIDE(
      t.avg_spend_7_days * sow.weight * 7,
      SAFE_DIVIDE(t.sum_spend, t.sum_bc0)
    ),
    0
  ) AS New_Users

FROM users_7 u

LEFT JOIN spend_7 s
  ON s.Day_First_Charge_Acquired = u.Day_First_Charge_Acquired

LEFT JOIN sow
  ON sow.day_of_week = FORMAT_DATE('%A', u.Day_First_Charge_Acquired)

CROSS JOIN totals t

ORDER BY u.Day_First_Charge_Acquired;
