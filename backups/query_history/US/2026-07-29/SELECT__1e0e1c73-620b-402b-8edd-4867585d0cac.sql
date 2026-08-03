-- job_id: 1e0e1c73-620b-402b-8edd-4867585d0cac
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T05:02:13.675000+00:00
-- started: 2026-07-29T05:02:13.771000+00:00
-- ended: 2026-07-29T05:02:13.870000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
