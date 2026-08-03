-- job_id: 481b9ccb-54c8-4d13-bbc9-e686cd5e581a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:11:57.917000+00:00
-- started: 2026-07-29T14:11:58.041000+00:00
-- ended: 2026-07-29T14:11:58.159000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
