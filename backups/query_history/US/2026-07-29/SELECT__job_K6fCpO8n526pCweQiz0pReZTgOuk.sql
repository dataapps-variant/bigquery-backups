-- job_id: job_K6fCpO8n526pCweQiz0pReZTgOuk
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:11:23.820000+00:00
-- started: 2026-07-29T15:11:23.914000+00:00
-- ended: 2026-07-29T15:11:24.279000+00:00

SELECT COUNT(*) n, STRING_AGG(DISTINCT Entity ORDER BY Entity) ents, MAX(Loaded_At) loaded FROM `variant-finance-data-project.R100.R100_Input_Selection_Spend`
