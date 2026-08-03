-- job_id: 2db6ff57-f766-418a-8628-5e9f23537a28
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:51.882000+00:00
-- started: 2026-08-02T00:09:51.970000+00:00
-- ended: 2026-08-02T00:09:52.180000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_Incremental WHERE order_id IS NOT NULL;
