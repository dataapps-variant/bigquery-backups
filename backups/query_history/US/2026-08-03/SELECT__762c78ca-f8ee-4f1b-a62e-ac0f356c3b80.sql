-- job_id: 762c78ca-f8ee-4f1b-a62e-ac0f356c3b80
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T01:07:29.930000+00:00
-- started: 2026-08-03T01:07:30.026000+00:00
-- ended: 2026-08-03T01:07:30.136000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
