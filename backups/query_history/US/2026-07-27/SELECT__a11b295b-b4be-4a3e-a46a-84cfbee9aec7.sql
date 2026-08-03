-- job_id: a11b295b-b4be-4a3e-a46a-84cfbee9aec7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T19:03:47.901000+00:00
-- started: 2026-07-27T19:03:48.187000+00:00
-- ended: 2026-07-27T19:03:48.306000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
