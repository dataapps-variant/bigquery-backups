-- job_id: b74f7fde-770f-4ce1-b265-c28f493999a3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T19:07:05.190000+00:00
-- started: 2026-08-01T19:07:05.353000+00:00
-- ended: 2026-08-01T19:07:05.498000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
