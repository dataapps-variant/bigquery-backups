-- job_id: 027875c4-05fb-4ad0-bb87-7151c42da728
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T04:06:04.439000+00:00
-- started: 2026-08-03T04:06:04.624000+00:00
-- ended: 2026-08-03T04:06:04.755000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
