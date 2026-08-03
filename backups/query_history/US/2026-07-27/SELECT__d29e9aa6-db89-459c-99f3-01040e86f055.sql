-- job_id: d29e9aa6-db89-459c-99f3-01040e86f055
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T16:05:03.556000+00:00
-- started: 2026-07-27T16:05:03.670000+00:00
-- ended: 2026-07-27T16:05:03.830000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
