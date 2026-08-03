-- job_id: b1e99517-c9a9-4e5d-af0a-a03804fb8018
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:33:13.216000+00:00
-- started: 2026-07-30T10:33:13.308000+00:00
-- ended: 2026-07-30T10:33:13.477000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
