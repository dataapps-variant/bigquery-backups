-- job_id: 3d3fb5d8-909f-4f65-9081-2992ba4cdeea
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:08:55.658000+00:00
-- started: 2026-07-30T16:08:55.766000+00:00
-- ended: 2026-07-30T16:08:55.877000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
