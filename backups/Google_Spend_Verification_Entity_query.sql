-- ============================================================
-- GOOGLE ADS SPEND VERIFICATION — ENTITY LEVEL
-- Grain: Channel_name × Entity (App_name) × Month
-- Each table has its own Expected / Actual / Diff columns (named by real table)
-- Months from Jan 2025 -> current, labelled "Jan 25" / "Apr 26", newest first
-- Target: variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Spend_Verification_Entity
-- ============================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Spend_Verification_Entity` AS

WITH
-- ── Ad-level final spend (source branch, from ad_performance + ad_performance_daily) ──
ads_final AS (
  SELECT Channel_name, App_name, DATE_TRUNC(Date, MONTH) AS Month_Key, ROUND(SUM(Amount),2) AS cnt
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_final_spend`
  WHERE Date >= '2025-01-01'
  GROUP BY 1,2,3
),

-- ── Campaign-level final spend (source branch, from campaign_performance) ──
campaigns_final AS (
  SELECT Channel_name, App_name, DATE_TRUNC(Date, MONTH) AS Month_Key, ROUND(SUM(Amount),2) AS cnt
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_campaigns_final_spend`
  WHERE Date >= '2025-01-01'
  GROUP BY 1,2,3
),

-- ── Google merged (= ads + campaigns) ──
google_merged AS (
  SELECT Channel_name, App_name, DATE_TRUNC(Date, MONTH) AS Month_Key, ROUND(SUM(Amount),2) AS cnt
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
  WHERE Date >= '2025-01-01'
  GROUP BY 1,2,3
),

-- ── Merged spend view (all channels) — Google only ──
merged_view AS (
  SELECT Channel_name, App_name, DATE_TRUNC(Date, MONTH) AS Month_Key, ROUND(SUM(Amount),2) AS cnt
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View`
  WHERE Date >= '2025-01-01' AND Channel_name = 'Google_Ads'
  GROUP BY 1,2,3
),

-- ── Merged spend view updated (sticky) — Google only ──
merged_updated AS (
  SELECT Channel_name, App_name, DATE_TRUNC(Date, MONTH) AS Month_Key, ROUND(SUM(Amount),2) AS cnt
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`
  WHERE Date >= '2025-01-01' AND Channel_name = 'Google_Ads'
  GROUP BY 1,2,3
),

-- ── Final split table (allocated_spend) — Google only; CT-JP/CT-Non-JP collapsed to CT ──
split_tbl AS (
  SELECT Channel_name,
         CASE WHEN App_Name IN ('CT-JP','CT-Non-JP') THEN 'CT' ELSE App_Name END AS App_name,
         DATE_TRUNC(Date, MONTH) AS Month_Key,
         ROUND(SUM(allocated_spend),2) AS cnt
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE Date >= '2025-01-01' AND Channel_name = 'Google_Ads'
  GROUP BY 1,2,3
),

-- ── Spine: every Channel × App × Month ──
spine AS (
  SELECT Channel_name, App_name, Month_Key FROM ads_final UNION DISTINCT
  SELECT Channel_name, App_name, Month_Key FROM campaigns_final UNION DISTINCT
  SELECT Channel_name, App_name, Month_Key FROM google_merged UNION DISTINCT
  SELECT Channel_name, App_name, Month_Key FROM merged_view UNION DISTINCT
  SELECT Channel_name, App_name, Month_Key FROM merged_updated UNION DISTINCT
  SELECT Channel_name, App_name, Month_Key FROM split_tbl
)

SELECT
  CURRENT_TIMESTAMP() AS Last_Refreshed,
  s.Channel_name                       AS Channel_Name,
  s.App_name                           AS Entity_Name,
  FORMAT_DATE('%b %y', s.Month_Key)    AS Month,

  -- ── SOURCE BRANCHES (actuals only) ──
  af.cnt                               AS `Google_Ads_final_spend Actual`,
  cf.cnt                               AS `Google_campaigns_final_spend Actual`,

  -- ── Google_merged_final_spend  (Expected = ads + campaigns) ──
  ROUND(COALESCE(af.cnt,0) + COALESCE(cf.cnt,0), 2)               AS `Google_merged_final_spend Expected`,
  gm.cnt                                                          AS `Google_merged_final_spend Actual`,
  ROUND(COALESCE(gm.cnt,0) - COALESCE(af.cnt,0) - COALESCE(cf.cnt,0), 2) AS `Google_merged_final_spend Diff`,

  -- ── Merged_Spend_View  (Expected = merged) ──
  gm.cnt                                                          AS `Merged_Spend_View Expected`,
  mv.cnt                                                          AS `Merged_Spend_View Actual`,
  ROUND(COALESCE(mv.cnt,0) - COALESCE(gm.cnt,0), 2)              AS `Merged_Spend_View Diff`,

  -- ── Merged_Spend_View_Updated  (Expected = view) ──
  mv.cnt                                                          AS `Merged_Spend_View_Updated Expected`,
  mu.cnt                                                          AS `Merged_Spend_View_Updated Actual`,
  ROUND(COALESCE(mu.cnt,0) - COALESCE(mv.cnt,0), 2)              AS `Merged_Spend_View_Updated Diff`,

  -- ── Merged_Spend_Split_TBL  (Expected = updated; Actual = allocated_spend) ──
  mu.cnt                                                          AS `Merged_Spend_Split_TBL Expected`,
  st.cnt                                                          AS `Merged_Spend_Split_TBL Actual`,
  ROUND(COALESCE(st.cnt,0) - COALESCE(mu.cnt,0), 2)              AS `Merged_Spend_Split_TBL Diff`,

  -- ── STATUS ──
  CASE
    WHEN ABS(COALESCE(gm.cnt,0) - COALESCE(af.cnt,0) - COALESCE(cf.cnt,0)) <= 1
     AND ABS(COALESCE(mv.cnt,0) - COALESCE(gm.cnt,0)) <= 1
     AND ABS(COALESCE(mu.cnt,0) - COALESCE(mv.cnt,0)) <= 1
     AND ABS(COALESCE(st.cnt,0) - COALESCE(mu.cnt,0)) <= 1
    THEN 'OK'
    ELSE 'MISMATCH'
  END AS Status

FROM spine s
LEFT JOIN ads_final       af ON s.Channel_name=af.Channel_name AND s.App_name=af.App_name AND s.Month_Key=af.Month_Key
LEFT JOIN campaigns_final cf ON s.Channel_name=cf.Channel_name AND s.App_name=cf.App_name AND s.Month_Key=cf.Month_Key
LEFT JOIN google_merged   gm ON s.Channel_name=gm.Channel_name AND s.App_name=gm.App_name AND s.Month_Key=gm.Month_Key
LEFT JOIN merged_view     mv ON s.Channel_name=mv.Channel_name AND s.App_name=mv.App_name AND s.Month_Key=mv.Month_Key
LEFT JOIN merged_updated  mu ON s.Channel_name=mu.Channel_name AND s.App_name=mu.App_name AND s.Month_Key=mu.Month_Key
LEFT JOIN split_tbl       st ON s.Channel_name=st.Channel_name AND s.App_name=st.App_name AND s.Month_Key=st.Month_Key
ORDER BY s.Month_Key DESC, s.Channel_name, s.App_name;
