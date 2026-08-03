-- job_id: bc01079a-690c-4ebe-abe2-4f423d3e5030
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:33:12.826000+00:00
-- started: 2026-07-29T11:33:12.897000+00:00
-- ended: 2026-07-29T11:33:13.142000+00:00

SELECT SUM(`Subscription_users`) AS `Subscription_users`, SUM(`Rebill_users`) AS `Rebill_users`, SUM(`Churn_rate`) AS `Churn_rate`, SUM(`Retention_rate`) AS `Retention_rate`, SUM(`NET_Retention_rate`) AS `NET_Retention_rate`, SUM(`Refund_ratio`) AS `Refund_ratio`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
 WHERE Billing_Cycle=4 AND Report_date BETWEEN '2025-01-01' AND '2026-07-29'
   AND CONCAT(Product_Name_Final,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT2788YT|CA','AT1995YT|US','AT1995YT|CA','CL2995ST|US','CL2995ST|CA','CL2788ST|US','CL2788ST|CA')
