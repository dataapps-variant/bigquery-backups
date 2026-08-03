-- job_id: 7dd991f7-8748-4d52-82a0-aa61d216dc98
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:31:37.366000+00:00
-- started: 2026-08-02T16:31:37.482000+00:00
-- ended: 2026-08-02T16:31:37.604000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
