-- job_id: cd130ad7-1112-4318-8448-e015861ff273
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T16:30:38.198000+00:00
-- started: 2026-07-29T16:30:38.445000+00:00
-- ended: 2026-07-29T16:30:38.567000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
