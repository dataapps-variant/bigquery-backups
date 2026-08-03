-- job_id: 1053206b-6d04-40c7-8ad3-6dd2a14f21a5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:13:54.035000+00:00
-- started: 2026-07-31T16:13:54.134000+00:00
-- ended: 2026-07-31T16:13:54.244000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
