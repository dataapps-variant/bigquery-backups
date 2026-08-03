-- job_id: 2cba1e7b-0e25-4e52-a0d4-5cf7164a7b83
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:21:04.749000+00:00
-- started: 2026-08-03T06:21:04.879000+00:00
-- ended: 2026-08-03T06:21:04.976000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
