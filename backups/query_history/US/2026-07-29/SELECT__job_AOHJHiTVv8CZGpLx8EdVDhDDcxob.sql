-- job_id: job_AOHJHiTVv8CZGpLx8EdVDhDDcxob
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:11:21.934000+00:00
-- started: 2026-07-29T15:11:22.041000+00:00
-- ended: 2026-07-29T15:11:22.376000+00:00

SELECT COUNT(*) n, STRING_AGG(DISTINCT Entity ORDER BY Entity) ents, MAX(Loaded_At) loaded FROM `variant-finance-data-project.R100.R100_Inputs_Full`
