-- job_id: d99bed38-ee99-4e53-9119-869c66027be9
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:31:36.549000+00:00
-- started: 2026-07-30T16:31:36.662000+00:00
-- ended: 2026-07-30T16:31:36.756000+00:00

SELECT App_Name, Country_code, Product_Name_final AS Plan_Name, Start_Date, End_Date, Allocation FROM `variant-finance-data-project.Ad_spend_data.Dim_spend_split` ORDER BY End_Date DESC
