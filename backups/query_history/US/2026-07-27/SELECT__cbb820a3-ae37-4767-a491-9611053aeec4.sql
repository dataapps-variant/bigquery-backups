-- job_id: cbb820a3-ae37-4767-a491-9611053aeec4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T17:01:20.010000+00:00
-- started: 2026-07-27T17:01:20.175000+00:00
-- ended: 2026-07-27T17:01:20.320000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
