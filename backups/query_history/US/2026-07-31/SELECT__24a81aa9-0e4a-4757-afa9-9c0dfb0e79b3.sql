-- job_id: 24a81aa9-0e4a-4757-afa9-9c0dfb0e79b3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:07:22.115000+00:00
-- started: 2026-07-31T16:07:22.237000+00:00
-- ended: 2026-07-31T16:07:22.345000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
