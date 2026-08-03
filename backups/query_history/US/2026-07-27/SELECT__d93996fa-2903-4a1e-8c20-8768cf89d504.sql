-- job_id: d93996fa-2903-4a1e-8c20-8768cf89d504
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T16:32:19.237000+00:00
-- started: 2026-07-27T16:32:19.369000+00:00
-- ended: 2026-07-27T16:32:19.505000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
