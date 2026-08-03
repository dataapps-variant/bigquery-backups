-- job_id: 4ec897c6-43b5-4ff5-ab33-590a43dafe44
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:47:51.546000+00:00
-- started: 2026-07-29T11:47:51.651000+00:00
-- ended: 2026-07-29T11:47:51.846000+00:00

SELECT DISTINCT Spend_Country_Code_AFID c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE Spend_Country_Code_AFID IS NOT NULL ORDER BY c
