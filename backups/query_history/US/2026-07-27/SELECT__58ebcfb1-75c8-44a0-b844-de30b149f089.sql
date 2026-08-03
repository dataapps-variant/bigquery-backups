-- job_id: 58ebcfb1-75c8-44a0-b844-de30b149f089
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T15:04:08.234000+00:00
-- started: 2026-07-27T15:04:08.353000+00:00
-- ended: 2026-07-27T15:04:08.504000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
