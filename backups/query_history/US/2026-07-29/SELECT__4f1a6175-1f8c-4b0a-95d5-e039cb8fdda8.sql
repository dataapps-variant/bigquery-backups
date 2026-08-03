-- job_id: 4f1a6175-1f8c-4b0a-95d5-e039cb8fdda8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:48:43.499000+00:00
-- started: 2026-07-29T11:48:43.618000+00:00
-- ended: 2026-07-29T11:48:43.817000+00:00

SELECT App_Name, Plan_Name, COUNT(*) n FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
 WHERE Cohort='7K_30D' AND `Table`='Regular' AND Plan_Name LIKE 'CT2788YT%'
 GROUP BY 1,2 ORDER BY 1,2
