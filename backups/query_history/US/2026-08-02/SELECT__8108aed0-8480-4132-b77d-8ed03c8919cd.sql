-- job_id: 8108aed0-8480-4132-b77d-8ed03c8919cd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:20.304000+00:00
-- started: 2026-08-02T00:09:20.398000+00:00
-- ended: 2026-08-02T00:09:22.017000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.test_Sticky_data_API_original_JF_Incremental WHERE order_id IS NOT NULL;
