-- job_id: 409c4d4d-10f7-4032-abe5-9636762e607f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:09:24.872000+00:00
-- started: 2026-08-01T06:09:25.014000+00:00
-- ended: 2026-08-01T06:09:25.241000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
