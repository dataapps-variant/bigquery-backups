-- job_id: 234303cb-8ab4-4620-8fb0-524e7382aacd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:02:35.626000+00:00
-- started: 2026-07-30T17:02:35.790000+00:00
-- ended: 2026-07-30T17:02:35.907000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
