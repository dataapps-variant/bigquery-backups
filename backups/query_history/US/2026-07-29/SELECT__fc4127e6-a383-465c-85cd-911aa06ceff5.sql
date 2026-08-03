-- job_id: fc4127e6-a383-465c-85cd-911aa06ceff5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:16:15.543000+00:00
-- started: 2026-07-29T11:16:15.620000+00:00
-- ended: 2026-07-29T11:16:15.756000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC
