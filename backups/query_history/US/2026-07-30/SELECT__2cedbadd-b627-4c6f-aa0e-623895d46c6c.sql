-- job_id: 2cedbadd-b627-4c6f-aa0e-623895d46c6c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T18:02:47.559000+00:00
-- started: 2026-07-30T18:02:47.708000+00:00
-- ended: 2026-07-30T18:02:47.887000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
