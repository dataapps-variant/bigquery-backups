-- job_id: 9721a837-1bdd-4c88-a254-fc1d91a8315a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T00:04:56.182000+00:00
-- started: 2026-07-28T00:04:56.277000+00:00
-- ended: 2026-07-28T00:04:56.382000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
