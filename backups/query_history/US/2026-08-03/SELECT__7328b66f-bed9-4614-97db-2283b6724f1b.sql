-- job_id: 7328b66f-bed9-4614-97db-2283b6724f1b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T05:01:19.187000+00:00
-- started: 2026-08-03T05:01:19.343000+00:00
-- ended: 2026-08-03T05:01:19.463000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
