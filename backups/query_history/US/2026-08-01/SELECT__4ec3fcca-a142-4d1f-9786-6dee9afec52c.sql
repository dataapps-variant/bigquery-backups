-- job_id: 4ec3fcca-a142-4d1f-9786-6dee9afec52c
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T10:31:34.617000+00:00
-- started: 2026-08-01T10:31:34.711000+00:00
-- ended: 2026-08-01T10:31:34.810000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
