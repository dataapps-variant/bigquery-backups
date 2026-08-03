-- job_id: 3085d14b-4425-46e6-b295-0dc76f0c2c50
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:04:10.394000+00:00
-- started: 2026-07-29T08:04:10.515000+00:00
-- ended: 2026-07-29T08:04:10.608000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
