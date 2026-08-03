-- job_id: 0863a314-3c2d-40f8-a0d3-d70d487e6f64
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T18:06:48.448000+00:00
-- started: 2026-07-29T18:06:48.538000+00:00
-- ended: 2026-07-29T18:06:48.713000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
