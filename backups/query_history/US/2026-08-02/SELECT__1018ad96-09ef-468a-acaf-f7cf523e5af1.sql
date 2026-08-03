-- job_id: 1018ad96-09ef-468a-acaf-f7cf523e5af1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:04:29.887000+00:00
-- started: 2026-08-02T00:04:29.977000+00:00
-- ended: 2026-08-02T00:04:31.539000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_Incremental WHERE order_id IS NOT NULL;
