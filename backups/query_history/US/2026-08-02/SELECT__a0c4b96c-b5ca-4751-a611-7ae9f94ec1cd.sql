-- job_id: a0c4b96c-b5ca-4751-a611-7ae9f94ec1cd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:01:04.494000+00:00
-- started: 2026-08-02T00:01:04.598000+00:00
-- ended: 2026-08-02T00:01:04.747000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_Incremental WHERE order_id IS NOT NULL;
