-- job_id: 587b2a24-d3de-4a18-8813-974f8448dcf3
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:31:40.402000+00:00
-- started: 2026-07-28T16:31:40.483000+00:00
-- ended: 2026-07-28T16:31:40.609000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
