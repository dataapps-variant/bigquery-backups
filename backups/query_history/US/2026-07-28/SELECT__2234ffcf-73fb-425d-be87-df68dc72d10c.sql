-- job_id: 2234ffcf-73fb-425d-be87-df68dc72d10c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T18:01:39.011000+00:00
-- started: 2026-07-28T18:01:39.208000+00:00
-- ended: 2026-07-28T18:01:39.353000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
