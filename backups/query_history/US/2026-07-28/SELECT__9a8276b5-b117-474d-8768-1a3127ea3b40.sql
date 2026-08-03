-- job_id: 9a8276b5-b117-474d-8768-1a3127ea3b40
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:03:56.280000+00:00
-- started: 2026-07-28T12:03:56.380000+00:00
-- ended: 2026-07-28T12:03:56.501000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
