-- job_id: 3b32af64-4ee5-4d45-ab86-191881f34d3e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:15:11.347000+00:00
-- started: 2026-07-31T16:15:11.476000+00:00
-- ended: 2026-07-31T16:15:11.606000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
