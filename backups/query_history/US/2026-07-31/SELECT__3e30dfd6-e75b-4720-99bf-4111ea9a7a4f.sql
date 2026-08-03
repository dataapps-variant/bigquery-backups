-- job_id: 3e30dfd6-e75b-4720-99bf-4111ea9a7a4f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T17:07:47.800000+00:00
-- started: 2026-07-31T17:07:47.936000+00:00
-- ended: 2026-07-31T17:07:48.048000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
