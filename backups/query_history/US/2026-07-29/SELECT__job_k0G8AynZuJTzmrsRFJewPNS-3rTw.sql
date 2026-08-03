-- job_id: job_k0G8AynZuJTzmrsRFJewPNS-3rTw
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:11:22.899000+00:00
-- started: 2026-07-29T15:11:22.973000+00:00
-- ended: 2026-07-29T15:11:23.324000+00:00

SELECT COUNT(*) n, STRING_AGG(DISTINCT Entity ORDER BY Entity) ents, MAX(Loaded_At) loaded FROM `variant-finance-data-project.R100.R100_Input_Selection`
