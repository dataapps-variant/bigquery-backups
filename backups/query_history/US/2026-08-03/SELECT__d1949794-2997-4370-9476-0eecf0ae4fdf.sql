-- job_id: d1949794-2997-4370-9476-0eecf0ae4fdf
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:32:28.288000+00:00
-- started: 2026-08-03T10:32:28.406000+00:00
-- ended: 2026-08-03T10:32:28.502000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
