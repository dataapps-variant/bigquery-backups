-- job_id: 89e1e8d0-f1ee-4c55-ad7d-f47dc1b0a5ee
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T21:05:07.127000+00:00
-- started: 2026-08-02T21:05:07.224000+00:00
-- ended: 2026-08-02T21:05:07.373000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
