-- job_id: 916de978-4cd9-4b0f-aaa9-551bd4c3813f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T05:02:20.162000+00:00
-- started: 2026-07-31T05:02:20.297000+00:00
-- ended: 2026-07-31T05:02:20.410000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
