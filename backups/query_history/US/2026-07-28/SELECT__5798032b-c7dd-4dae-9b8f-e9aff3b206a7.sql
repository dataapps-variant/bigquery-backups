-- job_id: 5798032b-c7dd-4dae-9b8f-e9aff3b206a7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:03:34.461000+00:00
-- started: 2026-07-28T13:03:34.546000+00:00
-- ended: 2026-07-28T13:03:34.657000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC
