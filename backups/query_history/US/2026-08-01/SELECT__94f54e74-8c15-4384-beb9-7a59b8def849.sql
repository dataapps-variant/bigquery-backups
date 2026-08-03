-- job_id: 94f54e74-8c15-4384-beb9-7a59b8def849
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:03:29.541000+00:00
-- started: 2026-08-01T13:03:29.657000+00:00
-- ended: 2026-08-01T13:03:29.782000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
