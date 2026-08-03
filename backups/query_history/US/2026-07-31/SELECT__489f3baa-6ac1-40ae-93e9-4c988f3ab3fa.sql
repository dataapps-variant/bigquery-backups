-- job_id: 489f3baa-6ac1-40ae-93e9-4c988f3ab3fa
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:12:50.282000+00:00
-- started: 2026-07-31T06:12:50.397000+00:00
-- ended: 2026-07-31T06:12:50.666000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
