-- job_id: 34e84a25-8a66-4f43-86c0-d0468319ac47
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:10.152000+00:00
-- started: 2026-08-02T12:00:10.258000+00:00
-- ended: 2026-08-02T12:00:10.614000+00:00

WITH plan_level AS (
  SELECT * FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table` WHERE Report_date BETWEEN current_date-120 AND current_date-1 AND Cohort_Size = 7000 AND App_Name NOT IN ('CT', 'CN', 'AT', 'IQ')
),
bc0_data AS (
  SELECT d.Report_date AS report_date, d.App_Name AS app, d.Product_Name_Final AS plan, d.Billing_Cycle AS billing_cycle, d.Refund_Amount AS refund_total, d.Cohort_final_users AS refund_plan_count, d.Trial_Price as trial_cost, d.Regular_Price AS rebill_cost FROM plan_level AS d
  LEFT JOIN (SELECT App_Name, Product_Name_Final, max(T30D_New_Users) AS T30D_New_Users FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table` WHERE Report_date = current_date-1 AND Billing_Cycle <= 1 GROUP BY App_Name, Product_Name_Final) AS t ON d.Product_Name_Final = t.Product_Name_Final AND d.App_Name = t.App_Name
  WHERE d.Billing_Cycle = 0 AND t.T30D_New_Users > 50
),
bc1_data AS (
  SELECT d.Report_date AS report_date, d.App_Name AS app, d.Product_Name_Final AS plan, d.Billing_Cycle AS billing_cycle, d.Refund_Amount AS refund_total, d.Cohort_final_users AS refund_plan_count, d.Trial_Price as trial_cost, d.Regular_Price AS rebill_cost FROM plan_level AS d
  LEFT JOIN (SELECT App_Name, Product_Name_Final, max(T30D_New_Users) AS T30D_New_Users FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table` WHERE Report_date = current_date-1 AND Billing_Cycle <= 1 GROUP BY App_Name, Product_Name_Final) AS t ON d.Product_Name_Final = t.Product_Name_Final AND d.App_Name = t.App_Name
  WHERE d.Billing_Cycle = 1 AND t.T30D_New_Users > 50
),
bc2_data AS (
  SELECT d.Report_date AS report_date, d.App_Name AS app, d.Product_Name_Final AS plan, d.Billing_Cycle AS billing_cycle, d.Refund_Amount AS refund_total, d.Cohort_final_users AS refund_plan_count, d.Trial_Price as trial_cost, d.Regular_Price AS rebill_cost FROM plan_level AS d
  LEFT JOIN (SELECT App_Name, Product_Name_Final, max(T30D_New_Users) AS T30D_New_Users FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table` WHERE Report_date = current_date-1 AND Billing_Cycle <= 1 GROUP BY App_Name, Product_Name_Final) AS t ON d.Product_Name_Final = t.Product_Name_Final AND d.App_Name = t.App_Name
  WHERE d.Billing_Cycle = 2 AND t.T30D_New_Users > 50
),
all_data AS (
  SELECT * FROM (SELECT *, countif(refund_total > 0) OVER (PARTITION BY app, plan) AS total FROM bc0_data) AS d WHERE total >= 7
  UNION ALL
  SELECT * FROM (SELECT *, countif(refund_total > 0) OVER (PARTITION BY app, plan) AS total FROM bc1_data) AS d WHERE total >= 7
  UNION ALL
  SELECT * FROM (SELECT *, countif(refund_total > 0) OVER (PARTITION BY app, plan) AS total FROM bc2_data) AS d WHERE total >= 7
)

SELECT report_date, CASE WHEN app = 'CT-JP' THEN 'CT - JP' WHEN app = 'CT-Non-JP' THEN 'CT - US' ELSE app END AS app, plan, CASE WHEN sum(rebill_value) = 0 THEN 0 ELSE COALESCE(sum(refund_total) / sum(rebill_value), 0.0) END AS refund_percent, is_trial
FROM (SELECT report_date, app, plan, refund_total, CASE WHEN billing_cycle = 0 THEN refund_plan_count * trial_cost ELSE refund_plan_count * rebill_cost END AS rebill_value, billing_cycle = 0 AS is_trial FROM all_data) AS d
GROUP BY report_date, app, plan, is_trial
ORDER BY report_date DESC
