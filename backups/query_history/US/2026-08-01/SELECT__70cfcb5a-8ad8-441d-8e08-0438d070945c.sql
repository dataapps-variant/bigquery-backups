-- job_id: 70cfcb5a-8ad8-441d-8e08-0438d070945c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T07:02:16.753000+00:00
-- started: 2026-08-01T07:02:16.911000+00:00
-- ended: 2026-08-01T07:02:17.028000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
