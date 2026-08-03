-- job_id: 9441bf2a-4f7f-45ed-b4a6-0c610ff452b3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T07:06:34.437000+00:00
-- started: 2026-08-03T07:06:34.559000+00:00
-- ended: 2026-08-03T07:06:34.651000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
