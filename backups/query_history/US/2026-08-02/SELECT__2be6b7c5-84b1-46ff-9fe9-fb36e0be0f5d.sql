-- job_id: 2be6b7c5-84b1-46ff-9fe9-fb36e0be0f5d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:05.709000+00:00
-- started: 2026-08-02T00:09:05.807000+00:00
-- ended: 2026-08-02T00:09:06.702000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_Incremental WHERE order_id IS NOT NULL;
