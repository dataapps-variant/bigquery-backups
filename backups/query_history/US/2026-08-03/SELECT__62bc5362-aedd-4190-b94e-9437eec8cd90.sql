-- job_id: 62bc5362-aedd-4190-b94e-9437eec8cd90
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:01:13.788000+00:00
-- started: 2026-08-03T12:01:13.886000+00:00
-- ended: 2026-08-03T12:01:14.011000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
