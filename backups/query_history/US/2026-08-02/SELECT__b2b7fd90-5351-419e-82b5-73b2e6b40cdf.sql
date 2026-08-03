-- job_id: b2b7fd90-5351-419e-82b5-73b2e6b40cdf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:05:24.473000+00:00
-- started: 2026-08-02T00:05:24.558000+00:00
-- ended: 2026-08-02T00:05:24.732000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_Incremental WHERE order_id IS NOT NULL;
