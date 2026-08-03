-- job_id: job_IZFoZ1KV8FWNGtxR09B3Bn8ROXm_
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:13:16.431000+00:00
-- started: 2026-07-29T15:13:16.564000+00:00
-- ended: 2026-07-29T15:13:16.787000+00:00

SELECT COUNT(*) n, COUNT(DISTINCT Entity) ents, MAX(Loaded_At) loaded FROM `variant-finance-data-project.R100.R100_Inputs_Full`
