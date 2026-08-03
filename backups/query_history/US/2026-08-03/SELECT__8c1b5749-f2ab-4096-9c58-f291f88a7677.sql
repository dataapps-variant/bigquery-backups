-- job_id: 8c1b5749-f2ab-4096-9c58-f291f88a7677
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:03:35.784000+00:00
-- started: 2026-08-03T06:03:35.900000+00:00
-- ended: 2026-08-03T06:03:36.026000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
