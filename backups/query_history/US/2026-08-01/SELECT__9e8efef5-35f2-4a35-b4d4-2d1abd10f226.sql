-- job_id: 9e8efef5-35f2-4a35-b4d4-2d1abd10f226
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T09:05:01.236000+00:00
-- started: 2026-08-01T09:05:01.411000+00:00
-- ended: 2026-08-01T09:05:01.521000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
