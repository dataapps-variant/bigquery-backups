-- job_id: 06d49d76-8fa1-4440-bb5f-c29646a18e7f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T17:02:53.001000+00:00
-- started: 2026-08-01T17:02:53.126000+00:00
-- ended: 2026-08-01T17:02:53.224000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
