-- job_id: 44ce071d-e006-4823-839e-5a24bc96dfc1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:21:48.219000+00:00
-- started: 2026-07-28T11:21:48.307000+00:00
-- ended: 2026-07-28T11:21:48.486000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC
