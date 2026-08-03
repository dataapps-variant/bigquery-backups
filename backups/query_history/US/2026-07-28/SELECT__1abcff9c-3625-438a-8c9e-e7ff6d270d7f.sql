-- job_id: 1abcff9c-3625-438a-8c9e-e7ff6d270d7f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T08:03:10.066000+00:00
-- started: 2026-07-28T08:03:10.164000+00:00
-- ended: 2026-07-28T08:03:10.290000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
