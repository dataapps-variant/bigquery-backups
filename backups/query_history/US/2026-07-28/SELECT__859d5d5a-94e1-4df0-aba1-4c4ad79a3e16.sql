-- job_id: 859d5d5a-94e1-4df0-aba1-4c4ad79a3e16
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T02:04:13.008000+00:00
-- started: 2026-07-28T02:04:13.117000+00:00
-- ended: 2026-07-28T02:04:13.272000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
