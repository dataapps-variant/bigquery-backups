-- job_id: c7a72fd1-1a5c-4698-b34b-485cd05c7f6b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:11:45.802000+00:00
-- started: 2026-07-28T05:11:45.949000+00:00
-- ended: 2026-07-28T05:11:46.094000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
