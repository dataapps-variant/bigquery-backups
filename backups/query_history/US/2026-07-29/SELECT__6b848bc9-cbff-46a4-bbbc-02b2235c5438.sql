-- job_id: 6b848bc9-cbff-46a4-bbbc-02b2235c5438
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:11.037000+00:00
-- started: 2026-07-29T12:00:11.123000+00:00
-- ended: 2026-07-29T12:00:11.423000+00:00

WITH d AS (SELECT Report_date AS report_date, CASE WHEN App_Name = 'CT-JP' THEN 'CT - JP' WHEN App_Name = 'CT-Non-JP' THEN 'CT - US' ELSE App_Name END AS app, Product_Name_Final AS plan, sum(ARPU) AS arpu, max(Billing_Cycle) = 1 AS is_billing_cycle_1 
FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball` WHERE Report_date BETWEEN current_date-120 AND current_date-1 AND Billing_Cycle <= 1 AND ARPU IS NOT NULL AND App_Name NOT IN ('CN', 'AT', 'IQ')
GROUP BY Report_date, App_Name, Product_Name_Final)

SELECT report_date, app, plan, arpu FROM d WHERE is_billing_cycle_1 = true ORDER BY report_date DESC
