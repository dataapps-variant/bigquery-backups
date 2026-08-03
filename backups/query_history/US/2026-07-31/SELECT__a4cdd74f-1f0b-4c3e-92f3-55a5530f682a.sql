-- job_id: a4cdd74f-1f0b-4c3e-92f3-55a5530f682a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:03:03.572000+00:00
-- started: 2026-07-31T19:03:03.692000+00:00
-- ended: 2026-07-31T19:03:03.813000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
