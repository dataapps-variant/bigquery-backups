-- job_id: 6f6e4696-1461-451d-b926-6bbc051c6c3b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T19:07:09.762000+00:00
-- started: 2026-08-01T19:07:09.882000+00:00
-- ended: 2026-08-01T19:07:09.994000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
