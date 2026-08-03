-- job_id: ceccd2ec-b670-47df-8a57-76f6364b00a8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:12:00.140000+00:00
-- started: 2026-07-31T09:12:00.240000+00:00
-- ended: 2026-07-31T09:12:00.451000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC
