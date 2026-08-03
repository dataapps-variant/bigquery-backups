-- job_id: 7ab30692-b58a-4e94-a211-a11f298ff0de
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T08:02:57.656000+00:00
-- started: 2026-08-03T08:02:57.738000+00:00
-- ended: 2026-08-03T08:02:57.856000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
