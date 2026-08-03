-- job_id: c4ebef58-bcd6-403e-b24e-8178f4b5169c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T16:08:04.363000+00:00
-- started: 2026-07-27T16:08:04.508000+00:00
-- ended: 2026-07-27T16:08:04.643000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
