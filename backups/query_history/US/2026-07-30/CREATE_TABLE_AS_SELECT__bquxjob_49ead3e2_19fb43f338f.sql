-- job_id: bquxjob_49ead3e2_19fb43f338f
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T18:17:53.109000+00:00
-- started: 2026-07-30T18:17:53.460000+00:00
-- ended: 2026-07-30T18:17:57.526000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.MIT_Approval_Rate_summary` AS
WITH mit_orders AS (
  SELECT * FROM (
    SELECT 
      s.Date_of_Sale AS order_date, 
      s.Final_Order_Status AS order_status, 
      s.AFID AS afid,
      c.Entity AS entity,                          -- NEW: Entity from campaign dim
      s.Customer_Number,
      s.Billing_Cycle,
      s.Order_Id,
      s.Decline_Reason_Category,
      s.Fault_Category
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` c   -- NEW: join instead of IN subquery
      ON s.campaign_id = c.Campaign_Id
    WHERE c.Entity = 'FS'
    AND CAST(s.Billing_Cycle AS INT64) > 0
    AND s.Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 126 DAY)
    AND s.AFID = 'gdnuss'
    QUALIFY ROW_NUMBER() OVER(
      PARTITION BY s.Customer_Number, s.Billing_Cycle 
      ORDER BY s.Order_Id ASC
    ) = 1
  ) AS mit_deduped
  WHERE order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 96 DAY)
),

daily_stats AS (
  SELECT 
    order_date,
    COUNT(*) AS total,
    COUNTIF(order_status <> 7) AS success,
    COUNTIF(order_status = 7) AS declined
  FROM mit_orders
  WHERE order_date <> CURRENT_DATE()
  GROUP BY order_date
),

rolling AS (
  SELECT
    order_date,
    total,
    success,
    declined,
    SUM(total) OVER (
      ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
    ) AS t7d_total,
    SUM(success) OVER (
      ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
    ) AS t7d_success,
    ROUND(SAFE_DIVIDE(
      SUM(success) OVER (
        ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
      ),
      SUM(total) OVER (
        ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
      )
    ) * 100, 4) AS t7d_approval_rate
  FROM daily_stats
),

filtered AS (
  SELECT *
  FROM rolling
  WHERE t7d_total >= 35
    AND order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
),

base_data AS (
  SELECT
    order_date,
    entity,                                        -- NEW
    afid,                                          -- NEW
    CASE
      WHEN order_status <> 7 THEN 'SUCCESS'
      ELSE 'FAILED'
    END AS order_outcome,
    CASE
      WHEN order_status <> 7 THEN 'SUCCESS'
      ELSE COALESCE(Decline_Reason_Category, 'Unknown')
    END AS decline_reason_category,
    CASE
      WHEN order_status <> 7 THEN 'SUCCESS'
      ELSE COALESCE(Fault_Category, 'Unknown')
    END AS fault_category
  FROM mit_orders
  WHERE order_date <> CURRENT_DATE()
    AND order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
),

reason_level AS (
  SELECT
    order_date,
    entity,                                        -- NEW
    afid,                                          -- NEW
    order_outcome,
    decline_reason_category,
    fault_category,
    COUNT(*) AS order_count
  FROM base_data
  GROUP BY order_date, entity, afid, order_outcome, decline_reason_category, fault_category
)

SELECT
  r.order_date,
  r.entity AS Entity,                              -- NEW
  r.afid AS AFID,                                  -- NEW
  f.total,
  f.success,
  f.declined,
  f.t7d_total,
  f.t7d_success,
  f.t7d_approval_rate,
  CASE 
    WHEN f.t7d_approval_rate = MIN(f.t7d_approval_rate) OVER () THEN '← ABSOLUTE LOW'
    ELSE ''
  END AS is_lowest,
  CASE 
    WHEN f.t7d_approval_rate = MAX(f.t7d_approval_rate) OVER () THEN '← ABSOLUTE HIGH'
    ELSE ''
  END AS is_highest,
  r.order_outcome,
  r.decline_reason_category,
  r.fault_category,
  r.order_count,
  CASE
    WHEN r.order_outcome = 'SUCCESS' THEN NULL
    ELSE ROUND(SAFE_DIVIDE(r.order_count, f.declined) * 100, 2)
  END AS pct_of_declined
FROM reason_level AS r
INNER JOIN filtered AS f
  ON r.order_date = f.order_date
ORDER BY r.order_date ASC, r.order_outcome DESC, r.order_count DESC
