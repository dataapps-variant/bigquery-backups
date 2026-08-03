-- job_id: a35b163f-f409-41bd-bbed-467f6a2cc1e1
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:40:12.121000+00:00
-- started: 2026-07-29T17:40:12.208000+00:00
-- ended: 2026-07-29T17:40:12.328000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
