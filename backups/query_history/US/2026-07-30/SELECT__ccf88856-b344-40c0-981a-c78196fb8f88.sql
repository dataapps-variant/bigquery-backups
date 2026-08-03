-- job_id: ccf88856-b344-40c0-981a-c78196fb8f88
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:37:18.907000+00:00
-- started: 2026-07-30T12:37:19.054000+00:00
-- ended: 2026-07-30T12:37:19.475000+00:00


SELECT Report_date, Product_Name_Final, Spend_Country_Code_AFID cty, Billing_Cycle,
  * EXCEPT(Report_date, Product_Name_Final, Spend_Country_Code_AFID, Billing_Cycle)
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Product_Name_Final='PD4988PTAA' AND Spend_Country_Code_AFID='US' AND Billing_Cycle=0
ORDER BY Report_date DESC LIMIT 2
