-- job_id: e7cfb553-c389-4c79-90be-a2f3c2da286c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T19:04:01.567000+00:00
-- started: 2026-07-27T19:04:01.678000+00:00
-- ended: 2026-07-27T19:04:01.994000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
