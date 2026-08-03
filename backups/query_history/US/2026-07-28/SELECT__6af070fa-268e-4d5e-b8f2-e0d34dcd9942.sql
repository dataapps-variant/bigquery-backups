-- job_id: 6af070fa-268e-4d5e-b8f2-e0d34dcd9942
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T02:01:40.671000+00:00
-- started: 2026-07-28T02:01:40.783000+00:00
-- ended: 2026-07-28T02:01:40.931000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
