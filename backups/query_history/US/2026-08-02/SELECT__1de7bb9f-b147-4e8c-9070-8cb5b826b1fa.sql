-- job_id: 1de7bb9f-b147-4e8c-9070-8cb5b826b1fa
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:08.930000+00:00
-- started: 2026-08-02T12:00:09.061000+00:00
-- ended: 2026-08-02T12:00:09.300000+00:00

WITH d AS (SELECT Report_date AS report_date, CASE WHEN App_Name = 'CT-JP' THEN 'CT - JP' WHEN App_Name = 'CT-Non-JP' THEN 'CT - US' ELSE App_Name END AS app, Product_Name_Final AS plan, sum(ARPU) AS arpu, max(Billing_Cycle) = 1 AS is_billing_cycle_1 
FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball` WHERE Report_date BETWEEN current_date-120 AND current_date-1 AND Billing_Cycle <= 1 AND ARPU IS NOT NULL AND App_Name NOT IN ('CN', 'AT', 'IQ')
GROUP BY Report_date, App_Name, Product_Name_Final)

SELECT report_date, app, plan, arpu FROM d WHERE is_billing_cycle_1 = true ORDER BY report_date DESC
