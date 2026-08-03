-- job_id: eb253aa4-6e6f-40aa-86e4-1703a1a749a5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:08:23.242000+00:00
-- started: 2026-08-01T12:08:23.353000+00:00
-- ended: 2026-08-01T12:08:23.468000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
