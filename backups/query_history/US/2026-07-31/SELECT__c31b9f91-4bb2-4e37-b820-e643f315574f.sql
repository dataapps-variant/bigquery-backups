-- job_id: c31b9f91-4bb2-4e37-b820-e643f315574f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T21:03:48.080000+00:00
-- started: 2026-07-31T21:03:48.202000+00:00
-- ended: 2026-07-31T21:03:48.335000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
