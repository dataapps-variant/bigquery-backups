-- job_id: 9a335559-b2d3-4fbf-9be9-88ca597a1a3d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T18:03:21.246000+00:00
-- started: 2026-07-31T18:03:21.456000+00:00
-- ended: 2026-07-31T18:03:21.596000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
