-- job_id: bdb13317-fdde-4357-b3f8-f51e8cab83da
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T15:04:02.246000+00:00
-- started: 2026-08-01T15:04:02.527000+00:00
-- ended: 2026-08-01T15:04:02.646000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
