-- job_id: 0d01c8f6-b07e-4fef-8a8e-713576458467
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:10:00.547000+00:00
-- started: 2026-08-02T00:10:00.932000+00:00
-- ended: 2026-08-02T00:10:01.091000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.test_Sticky_data_API_original_JF_Incremental WHERE order_id IS NOT NULL;
