-- job_id: 0d756672-fe79-434b-9d9e-df724f081e48
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:32:21.989000+00:00
-- started: 2026-07-28T10:32:22.119000+00:00
-- ended: 2026-07-28T10:32:22.225000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
