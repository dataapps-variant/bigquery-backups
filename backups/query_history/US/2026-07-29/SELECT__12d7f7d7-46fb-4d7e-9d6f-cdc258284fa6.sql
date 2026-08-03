-- job_id: 12d7f7d7-46fb-4d7e-9d6f-cdc258284fa6
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:34:21.463000+00:00
-- started: 2026-07-29T09:34:21.545000+00:00
-- ended: 2026-07-29T09:34:21.649000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
