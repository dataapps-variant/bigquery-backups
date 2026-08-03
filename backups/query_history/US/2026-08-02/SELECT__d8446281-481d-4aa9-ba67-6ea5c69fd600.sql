-- job_id: d8446281-481d-4aa9-ba67-6ea5c69fd600
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:00:03.484000+00:00
-- started: 2026-08-02T00:00:03.603000+00:00
-- ended: 2026-08-02T00:00:04.911000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_Incremental WHERE order_id IS NOT NULL;
