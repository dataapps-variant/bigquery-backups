-- job_id: acbbc621-69db-4752-bc88-c568d3784ed9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:08:57.418000+00:00
-- started: 2026-08-02T00:08:57.519000+00:00
-- ended: 2026-08-02T00:08:57.975000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN_Incremental WHERE order_id IS NOT NULL;
