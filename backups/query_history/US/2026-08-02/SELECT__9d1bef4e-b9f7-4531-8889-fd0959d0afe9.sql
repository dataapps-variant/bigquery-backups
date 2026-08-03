-- job_id: 9d1bef4e-b9f7-4531-8889-fd0959d0afe9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:46.728000+00:00
-- started: 2026-08-02T00:09:46.835000+00:00
-- ended: 2026-08-02T00:09:47.040000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN_Incremental WHERE order_id IS NOT NULL;
