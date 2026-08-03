-- job_id: 1bd937d5-9c07-4c7d-a81f-5daa2bc8af64
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T03:05:41.670000+00:00
-- started: 2026-08-01T03:05:41.785000+00:00
-- ended: 2026-08-01T03:05:41.903000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
