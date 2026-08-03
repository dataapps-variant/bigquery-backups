-- job_id: d3c6a746-2953-48c3-9cb2-e4948cafb7e1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:09:28.879000+00:00
-- started: 2026-07-29T11:09:28.965000+00:00
-- ended: 2026-07-29T11:09:29.148000+00:00

SELECT App_Name AS a, COUNT(*) c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE App_Name IS NOT NULL GROUP BY a ORDER BY c DESC
