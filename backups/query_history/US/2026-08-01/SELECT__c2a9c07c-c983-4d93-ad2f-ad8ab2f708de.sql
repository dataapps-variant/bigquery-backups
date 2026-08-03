-- job_id: c2a9c07c-c983-4d93-ad2f-ad8ab2f708de
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T17:01:48.540000+00:00
-- started: 2026-08-01T17:01:49.032000+00:00
-- ended: 2026-08-01T17:01:49.148000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
