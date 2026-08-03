-- job_id: 80e673bd-fcde-4833-922b-11e7819f0e2f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:07:41.438000+00:00
-- started: 2026-08-01T12:07:41.526000+00:00
-- ended: 2026-08-01T12:07:41.638000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
