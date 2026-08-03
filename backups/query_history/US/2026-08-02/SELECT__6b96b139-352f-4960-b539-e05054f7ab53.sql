-- job_id: 6b96b139-352f-4960-b539-e05054f7ab53
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T10:32:12.022000+00:00
-- started: 2026-08-02T10:32:12.121000+00:00
-- ended: 2026-08-02T10:32:12.232000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
