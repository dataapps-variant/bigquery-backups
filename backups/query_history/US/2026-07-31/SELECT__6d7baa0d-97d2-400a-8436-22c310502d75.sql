-- job_id: 6d7baa0d-97d2-400a-8436-22c310502d75
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:50:03.380000+00:00
-- started: 2026-07-31T09:50:03.481000+00:00
-- ended: 2026-07-31T09:50:03.633000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC
