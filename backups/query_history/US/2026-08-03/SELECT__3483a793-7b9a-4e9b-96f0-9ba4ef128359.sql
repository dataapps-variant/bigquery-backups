-- job_id: 3483a793-7b9a-4e9b-96f0-9ba4ef128359
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:03:48.420000+00:00
-- started: 2026-08-03T10:03:48.517000+00:00
-- ended: 2026-08-03T10:03:48.655000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
