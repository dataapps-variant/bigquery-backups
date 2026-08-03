-- job_id: dc0c8c26-0c28-4fea-ab65-e0b4f3abdf46
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:07:41.532000+00:00
-- started: 2026-08-01T16:07:41.685000+00:00
-- ended: 2026-08-01T16:07:41.912000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
