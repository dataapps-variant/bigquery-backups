-- job_id: c6e94a6f-135c-454e-b141-6a51e147c0f5
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:19:19.690000+00:00
-- started: 2026-07-31T12:19:19.752000+00:00
-- ended: 2026-07-31T12:19:19.847000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
