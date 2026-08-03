-- job_id: 01d23a6d-b990-4718-8679-89e6c6a12e2c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T21:02:34.660000+00:00
-- started: 2026-07-27T21:02:34.775000+00:00
-- ended: 2026-07-27T21:02:35.029000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
