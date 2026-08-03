-- job_id: 4fbe1c80-44d2-4151-a8c2-179dadfb4fef
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:47:55+00:00
-- started: 2026-07-29T11:47:55.098000+00:00
-- ended: 2026-07-29T11:47:55.313000+00:00

SELECT Product_Name_Final p, COUNT(*) n FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE Product_Name_Final IS NOT NULL GROUP BY p ORDER BY n DESC
