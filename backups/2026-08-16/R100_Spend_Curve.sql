CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Spend_Curve` AS
WITH window_weeks AS (
  SELECT week_start
  FROM UNNEST(
    GENERATE_DATE_ARRAY(
      DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 13 WEEK), WEEK(MONDAY)),
      DATE_TRUNC(CURRENT_DATE(), WEEK(MONDAY)),
      INTERVAL 1 WEEK
    )
  ) AS week_start
),
base AS (
  SELECT
    CASE
      WHEN s.App_Name = 'CT' AND s.Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN s.App_Name = 'CT' THEN 'CT-Non-JP'
      ELSE s.App_Name
    END AS Entity,
    COALESCE(p.Updated_Concat, s.Product_Name_Final) AS Plan_Name,
    DATE_TRUNC(s.Date_of_Sale, WEEK(MONDAY)) AS Week_Start,
    FORMAT_DATE('%A', s.Date_of_Sale) AS Day_Of_Week,
    s.Updated_Cust_ID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` p
    ON s.Product_Name_Final = p.Concat
  WHERE s.Date_of_Sale >= DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 13 WEEK), WEEK(MONDAY))
    AND s.Date_of_Sale <= CURRENT_DATE()
    AND s.App_Name IS NOT NULL
    AND s.Product_Name_Final IS NOT NULL
    AND s.Billing_Cycle_Updated IS NOT NULL
    AND s.Trial_Type IS NOT NULL
    AND (
      (s.Trial_Type = 'NT' AND CAST(s.Billing_Cycle_Updated AS INT64) = 1)
      OR (s.Trial_Type != 'NT' AND CAST(s.Billing_Cycle_Updated AS INT64) = 0)
    )
),
distinct_users AS (
  SELECT DISTINCT Entity, Plan_Name, Week_Start, Day_Of_Week, Updated_Cust_ID FROM base
),
plan_list AS (
  SELECT DISTINCT Entity, Plan_Name FROM base
),
plan_week_grid AS (
  SELECT p.Entity, p.Plan_Name, w.week_start AS Week_Start
  FROM plan_list p
  CROSS JOIN window_weeks w
),
weekly_counts AS (
  SELECT
    g.Entity,
    g.Plan_Name,
    g.Week_Start,
    DENSE_RANK() OVER (PARTITION BY g.Entity, g.Plan_Name ORDER BY g.Week_Start DESC) AS Week_Rank,
    COUNTIF(d.Day_Of_Week = 'Monday') AS Monday_Users,
    COUNTIF(d.Day_Of_Week = 'Tuesday') AS Tuesday_Users,
    COUNTIF(d.Day_Of_Week = 'Wednesday') AS Wednesday_Users,
    COUNTIF(d.Day_Of_Week = 'Thursday') AS Thursday_Users,
    COUNTIF(d.Day_Of_Week = 'Friday') AS Friday_Users,
    COUNTIF(d.Day_Of_Week = 'Saturday') AS Saturday_Users,
    COUNTIF(d.Day_Of_Week = 'Sunday') AS Sunday_Users,
    COUNT(d.Updated_Cust_ID) AS Week_Total
  FROM plan_week_grid g
  LEFT JOIN distinct_users d
    ON g.Entity = d.Entity
    AND g.Plan_Name = d.Plan_Name
    AND g.Week_Start = d.Week_Start
  GROUP BY g.Entity, g.Plan_Name, g.Week_Start
),
weekly_pcts AS (
  SELECT
    *,
    SAFE_DIVIDE(Monday_Users, Week_Total) AS Monday_Pct,
    SAFE_DIVIDE(Tuesday_Users, Week_Total) AS Tuesday_Pct,
    SAFE_DIVIDE(Wednesday_Users, Week_Total) AS Wednesday_Pct,
    SAFE_DIVIDE(Thursday_Users, Week_Total) AS Thursday_Pct,
    SAFE_DIVIDE(Friday_Users, Week_Total) AS Friday_Pct,
    SAFE_DIVIDE(Saturday_Users, Week_Total) AS Saturday_Pct,
    SAFE_DIVIDE(Sunday_Users, Week_Total) AS Sunday_Pct
  FROM weekly_counts
),
rolling_raw AS (
  SELECT Entity, Plan_Name,
    SAFE_DIVIDE(SUM(Monday_Pct    * Monday_Users),    SUM(Monday_Users))    AS Monday_Pct,
    SAFE_DIVIDE(SUM(Tuesday_Pct   * Tuesday_Users),   SUM(Tuesday_Users))   AS Tuesday_Pct,
    SAFE_DIVIDE(SUM(Wednesday_Pct * Wednesday_Users), SUM(Wednesday_Users)) AS Wednesday_Pct,
    SAFE_DIVIDE(SUM(Thursday_Pct  * Thursday_Users),  SUM(Thursday_Users))  AS Thursday_Pct,
    SAFE_DIVIDE(SUM(Friday_Pct    * Friday_Users),    SUM(Friday_Users))    AS Friday_Pct,
    SAFE_DIVIDE(SUM(Saturday_Pct  * Saturday_Users),  SUM(Saturday_Users))  AS Saturday_Pct,
    SAFE_DIVIDE(SUM(Sunday_Pct    * Sunday_Users),    SUM(Sunday_Users))    AS Sunday_Pct
  FROM weekly_pcts
  WHERE Week_Rank BETWEEN 2 AND 5
  GROUP BY Entity, Plan_Name
),
rolling_with_total AS (
  SELECT
    *,
    (IFNULL(Monday_Pct,0) + IFNULL(Tuesday_Pct,0) + IFNULL(Wednesday_Pct,0) +
     IFNULL(Thursday_Pct,0) + IFNULL(Friday_Pct,0) + IFNULL(Saturday_Pct,0) +
     IFNULL(Sunday_Pct,0)) AS Row_Total
  FROM rolling_raw
),
unpivoted AS (
  SELECT Entity, Plan_Name, 1 AS day_order, 'Monday'    AS day_of_week, SAFE_DIVIDE(Monday_Pct,    Row_Total) AS Pct FROM rolling_with_total
  UNION ALL
  SELECT Entity, Plan_Name, 2, 'Tuesday',   SAFE_DIVIDE(Tuesday_Pct,   Row_Total) FROM rolling_with_total
  UNION ALL
  SELECT Entity, Plan_Name, 3, 'Wednesday', SAFE_DIVIDE(Wednesday_Pct, Row_Total) FROM rolling_with_total
  UNION ALL
  SELECT Entity, Plan_Name, 4, 'Thursday',  SAFE_DIVIDE(Thursday_Pct,  Row_Total) FROM rolling_with_total
  UNION ALL
  SELECT Entity, Plan_Name, 5, 'Friday',    SAFE_DIVIDE(Friday_Pct,    Row_Total) FROM rolling_with_total
  UNION ALL
  SELECT Entity, Plan_Name, 6, 'Saturday',  SAFE_DIVIDE(Saturday_Pct,  Row_Total) FROM rolling_with_total
  UNION ALL
  SELECT Entity, Plan_Name, 7, 'Sunday',    SAFE_DIVIDE(Sunday_Pct,    Row_Total) FROM rolling_with_total
)
SELECT
  Entity,
  Plan_Name,
  day_of_week,
  day_order,
  ROUND(IFNULL(Pct, 0), 4) AS weight_pct
FROM unpivoted
ORDER BY Entity, Plan_Name, day_order;
