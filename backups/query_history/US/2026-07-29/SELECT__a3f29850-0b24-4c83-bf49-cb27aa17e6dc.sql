-- job_id: a3f29850-0b24-4c83-bf49-cb27aa17e6dc
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:48:45.158000+00:00
-- started: 2026-07-29T11:48:45.272000+00:00
-- ended: 2026-07-29T11:48:45.472000+00:00

SELECT App_Name, Product_Name_Final, COUNT(*) n FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
 WHERE Product_Name_Final LIKE 'CT2788YT%' GROUP BY 1,2 ORDER BY 1,2
