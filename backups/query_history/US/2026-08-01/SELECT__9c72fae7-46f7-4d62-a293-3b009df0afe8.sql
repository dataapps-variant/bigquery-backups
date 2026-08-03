-- job_id: 9c72fae7-46f7-4d62-a293-3b009df0afe8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T00:06:49.948000+00:00
-- started: 2026-08-01T00:06:50.073000+00:00
-- ended: 2026-08-01T00:06:50.262000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
