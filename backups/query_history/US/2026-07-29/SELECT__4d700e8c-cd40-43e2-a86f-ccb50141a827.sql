-- job_id: 4d700e8c-cd40-43e2-a86f-ccb50141a827
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T10:31:17.078000+00:00
-- started: 2026-07-29T10:31:17.183000+00:00
-- ended: 2026-07-29T10:31:17.292000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
