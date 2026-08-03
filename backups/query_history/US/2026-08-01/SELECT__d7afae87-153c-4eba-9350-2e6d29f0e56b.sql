-- job_id: d7afae87-153c-4eba-9350-2e6d29f0e56b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T00:05:43.187000+00:00
-- started: 2026-08-01T00:05:43.299000+00:00
-- ended: 2026-08-01T00:05:43.452000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
