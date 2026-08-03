-- job_id: 90697872-0104-469e-aecf-f1821fe4bb07
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:31:54.721000+00:00
-- started: 2026-07-31T10:31:54.809000+00:00
-- ended: 2026-07-31T10:31:54.905000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
