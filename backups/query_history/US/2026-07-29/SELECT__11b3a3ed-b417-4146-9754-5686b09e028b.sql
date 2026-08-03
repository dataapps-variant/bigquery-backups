-- job_id: 11b3a3ed-b417-4146-9754-5686b09e028b
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:50:06.770000+00:00
-- started: 2026-07-29T11:50:07.129000+00:00
-- ended: 2026-07-29T11:50:07.450000+00:00

SELECT SUM(`Subscription_users`) AS `Subscription_users`, SUM(`Rebill_users`) AS `Rebill_users`, SUM(`Churn_rate`) AS `Churn_rate`, SUM(`Retention_rate`) AS `Retention_rate`, SUM(`NET_Retention_rate`) AS `NET_Retention_rate`, SUM(`Refund_ratio`) AS `Refund_ratio`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE Billing_Cycle=4
      AND Report_date BETWEEN '2025-01-01' AND '2026-07-29'
      AND CONCAT(Product_Name_Final,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT1995YT|US','CL2788YT|US','CL1995YT|GB')
