-- job_id: 7b3654c6-b444-4398-915f-d7e1b6bfd759
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:49:27.006000+00:00
-- started: 2026-07-29T11:49:27.094000+00:00
-- ended: 2026-07-29T11:49:27.377000+00:00

SELECT (SELECT SUM(Subscription_users) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
   WHERE Billing_Cycle=4 AND Product_Name_Final='CT2788YT') AS main_total,
  (SELECT SUM(Subscriptions) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
   WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=4
     AND Plan_Name IN ('CT2788YT-JP','CT2788YT-Non-JP')) AS final_total
