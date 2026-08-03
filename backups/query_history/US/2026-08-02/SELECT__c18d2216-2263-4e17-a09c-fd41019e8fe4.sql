-- job_id: c18d2216-2263-4e17-a09c-fd41019e8fe4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:08:51.858000+00:00
-- started: 2026-08-02T00:08:51.942000+00:00
-- ended: 2026-08-02T00:08:52.665000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT_Incremental WHERE order_id IS NOT NULL;
