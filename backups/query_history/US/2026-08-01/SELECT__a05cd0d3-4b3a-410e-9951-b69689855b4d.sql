-- job_id: a05cd0d3-4b3a-410e-9951-b69689855b4d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T11:03:54.771000+00:00
-- started: 2026-08-01T11:03:54.856000+00:00
-- ended: 2026-08-01T11:03:54.946000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
