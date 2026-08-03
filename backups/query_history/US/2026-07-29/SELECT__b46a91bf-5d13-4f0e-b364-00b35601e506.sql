-- job_id: b46a91bf-5d13-4f0e-b364-00b35601e506
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:51:35.995000+00:00
-- started: 2026-07-29T11:51:36.113000+00:00
-- ended: 2026-07-29T11:51:36.337000+00:00

SELECT SUM(`Subscriptions`) AS `Subscription_users`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level`
 WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=4 AND Reporting_Date BETWEEN '2025-01-01' AND '2026-07-29'
   AND CONCAT(App_Name,'|',Spend_Country_Code_AFID) IN ('CL|US','CL|CA','AT|US')
