-- job_id: 0ac55d33-c625-4503-9c7a-ffa9b2da2bfb
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T17:32:31.708000+00:00
-- started: 2026-07-30T17:32:31.837000+00:00
-- ended: 2026-07-30T17:32:32.079000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC
