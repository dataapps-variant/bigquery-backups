-- R100 Single Sale: attach rate + refund rate per single-sale plan, rebuilt
-- over a rolling 100-day window (the same window the R100 model reads).
--
-- Rules agreed with finance:
--  * NEW purchases only, everywhere. Billing cycle 0 is the initial buy; a
--    renewal is not a new subscriber attaching a one-off. Some legacy single
--    sales still renew (AT's entire book is renewals today), and counting
--    those put AT2997SS at a 323% attach rate.
--  * Plan_New_Users uses the plan's ENTRY cycle: BC1 for NT plans, BC0 for
--    everything else. The projection multiplies the attach rate by projected
--    NEW users, so the denominator has to be new users too.
--  * Mapped_Plan_Name = the CURRENT mapping only (latest row in
--    Sticky_Dim_SS), then put through R100_BQ_Updated_Product_Name so it
--    matches the codes R100_Historical_Main carries. PD4988AA and PD4988PT
--    both rename to PD4988MT, which is why a 50/50 split between them needs
--    no allocation maths — both land on the same plan.
--  * The SS plan keeps its OWN name, un-renamed. The rename map rewrites a few
--    AT single sales into subscription codes (AT2997SS -> AT2997NT), which
--    would both lose the single sale and contradict Sticky_Dim_SS.
--  * Price is Plan_Price_USD from the most recent sale — the list price, not
--    the digits decoded out of the plan code.
--  * Refund_Rate is refunds landing in the window over revenue in the window,
--    same new-purchases-only rule as the attach rate. Below MIN_BUYERS the
--    plan's own rate is not trustworthy (one buyer who refunds reads as
--    100%), so it falls back to that app's blended single-sale rate;
--    Refund_Rate_Source records which was used.
CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Single_Sale` AS
WITH
-- The window ENDS YESTERDAY. Today is still being written to, so counting it
-- would divide a part-day of single sales into a part-day of new users and
-- skew every rate. Same rule as the pipelines' `cutoff = TODAY - 1`.
-- CURRENT_DATE()-100 .. CURRENT_DATE()-1 is exactly 100 whole days.
-- When this moves into the pipeline, both dates come from the run's own
-- boundary instead, so a backtest measures the rates as they stood then.
params AS (
  SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY) AS win_start,
         DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)   AS win_end,
         30                                         AS min_buyers
),
-- Latest mapping per SS plan; earlier mappings are deliberately ignored.
latest_map AS (
  SELECT Product_Name_Final_SS AS ss_plan,
         ARRAY_AGG(Product_Name_Final_Main ORDER BY Start_date DESC LIMIT 1)[OFFSET(0)] AS main_raw
  FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_SS`
  GROUP BY ss_plan
),
mapped AS (
  SELECT lm.ss_plan, COALESCE(r.Updated_Concat, lm.main_raw) AS main_plan
  FROM latest_map lm
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` r
    ON r.Concat = lm.main_raw
),
-- New single-sale purchases in the window.
ss_new AS (
  SELECT s.App_Name AS app_name, s.Product_Name_Final AS ss_plan,
         s.Updated_Cust_ID, s.Order_Price_Net_of_Tax_USD, s.Plan_Price_USD, s.Date_of_Sale
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s, params p
  WHERE s.Updated_Cust_ID IS NOT NULL
    AND UPPER(s.Trial_Type) = 'SS'
    AND s.Billing_Cycle_Updated = 0
    AND s.Date_of_Sale BETWEEN p.win_start AND p.win_end
),
ss_agg AS (
  SELECT app_name, ss_plan,
         COUNT(DISTINCT Updated_Cust_ID) AS ss_new_users,
         SUM(Order_Price_Net_of_Tax_USD) AS ss_revenue,
         ARRAY_AGG(Plan_Price_USD IGNORE NULLS ORDER BY Date_of_Sale DESC LIMIT 1)[SAFE_OFFSET(0)] AS plan_price
  FROM ss_new GROUP BY app_name, ss_plan
),
-- Refunds on those same new purchases, by the date the refund landed.
ss_refunds AS (
  SELECT s.App_Name AS app_name, s.Product_Name_Final AS ss_plan,
         SUM(s.Refund_Amount_USD) AS refunds
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s, params p
  WHERE UPPER(s.Trial_Type) = 'SS'
    AND s.Billing_Cycle_Updated = 0
    AND s.Refund_Amount_USD > 0
    AND s.Refund_Date BETWEEN p.win_start AND p.win_end
  GROUP BY app_name, ss_plan
),
-- App-level blended rate, the fallback for plans with too few buyers.
app_rate AS (
  SELECT a.app_name,
         SAFE_DIVIDE(SUM(IFNULL(r.refunds, 0)), SUM(a.ss_revenue)) AS rate
  FROM ss_agg a
  LEFT JOIN ss_refunds r ON r.app_name = a.app_name AND r.ss_plan = a.ss_plan
  GROUP BY a.app_name
),
-- New users of each main plan over the same window, from the R100 historical
-- table so the rate matches what the model actually projects. Summed across
-- inputs (channel/country splits) and, for CT, across CT-JP + CT-Non-JP.
main_new AS (
  SELECT h.Plan_Code, SUM(h.user_count) AS plan_new_users
  FROM `variant-finance-data-project.R100.R100_Historical_Main` h, params p
  WHERE h.activity_date BETWEEN p.win_start AND p.win_end
    AND h.bc_number = (CASE WHEN UPPER(RIGHT(h.Plan_Code, 2)) = 'NT' THEN 1 ELSE 0 END)
  GROUP BY h.Plan_Code
)
SELECT
  s.app_name                                               AS App_Name,
  s.ss_plan                                                AS SS_Plan_Name,
  mp.main_plan                                             AS Mapped_Plan_Name,
  s.ss_new_users                                           AS SS_New_Users_100d,
  mn.plan_new_users                                        AS Plan_New_Users_100d,
  ROUND(SAFE_DIVIDE(s.ss_new_users, mn.plan_new_users), 6) AS Attach_Rate,
  ROUND(s.plan_price, 2)                                   AS SS_Price,
  ROUND(s.ss_revenue, 2)                                   AS SS_Revenue_100d,
  ROUND(IFNULL(rf.refunds, 0), 2)                          AS SS_Refunds_100d,
  ROUND(IF(s.ss_new_users >= p.min_buyers,
           SAFE_DIVIDE(IFNULL(rf.refunds, 0), s.ss_revenue),
           ar.rate), 6)                                    AS Refund_Rate,
  ROUND(SAFE_DIVIDE(IFNULL(rf.refunds, 0), s.ss_revenue), 6) AS Refund_Rate_Own,
  IF(s.ss_new_users >= p.min_buyers, 'plan', 'app')        AS Refund_Rate_Source,
  ROUND(s.ss_revenue - IFNULL(rf.refunds, 0), 2)           AS SS_Net_Revenue_100d,
  p.win_start                                              AS Window_Start,
  p.win_end                                                AS Window_End,
  CURRENT_TIMESTAMP()                                      AS Loaded_At
FROM ss_agg s, params p
LEFT JOIN mapped     mp ON mp.ss_plan  = s.ss_plan
LEFT JOIN main_new   mn ON mn.Plan_Code = mp.main_plan
LEFT JOIN ss_refunds rf ON rf.app_name = s.app_name AND rf.ss_plan = s.ss_plan
LEFT JOIN app_rate   ar ON ar.app_name = s.app_name
ORDER BY s.ss_revenue DESC
