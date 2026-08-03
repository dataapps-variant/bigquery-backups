-- job_id: ac757f4b-2bbf-4238-95dc-3d8090d6eefe
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:14:31.173000+00:00
-- started: 2026-07-31T16:14:31.259000+00:00
-- ended: 2026-07-31T16:14:31.380000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
