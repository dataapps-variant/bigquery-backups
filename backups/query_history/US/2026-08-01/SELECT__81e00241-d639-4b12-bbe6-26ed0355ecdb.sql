-- job_id: 81e00241-d639-4b12-bbe6-26ed0355ecdb
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:31:52.447000+00:00
-- started: 2026-08-01T16:31:52.612000+00:00
-- ended: 2026-08-01T16:31:52.737000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
