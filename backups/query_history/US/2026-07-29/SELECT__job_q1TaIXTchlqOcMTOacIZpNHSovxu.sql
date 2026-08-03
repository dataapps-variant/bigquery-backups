-- job_id: job_q1TaIXTchlqOcMTOacIZpNHSovxu
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:13:17.305000+00:00
-- started: 2026-07-29T15:13:17.397000+00:00
-- ended: 2026-07-29T15:13:17.581000+00:00

SELECT COUNT(*) n, COUNT(DISTINCT Entity) ents, MAX(Loaded_At) loaded FROM `variant-finance-data-project.R100.R100_Input_Selection`
