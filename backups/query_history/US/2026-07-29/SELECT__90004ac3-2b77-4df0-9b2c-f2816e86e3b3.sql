-- job_id: 90004ac3-2b77-4df0-9b2c-f2816e86e3b3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:50:11.165000+00:00
-- started: 2026-07-29T11:50:11.282000+00:00
-- ended: 2026-07-29T11:50:11.454000+00:00

SELECT SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Recent_Users`) AS `Recent_Users`, SUM(`SS_Users`) AS `SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE Billing_Cycle=0
      AND Report_date BETWEEN '2025-01-01' AND '2026-07-29'
      AND CONCAT(Product_Name_Final,'|',Spend_Country_Code_AFID) IN ('AT2788YT|US','AT1995YT|US','CL2788YT|US','CL1995YT|GB')
