-- job_id: 81a3efd2-3ed7-4107-9dc5-8785841467db
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T03:03:20.574000+00:00
-- started: 2026-07-28T03:03:20.707000+00:00
-- ended: 2026-07-28T03:03:20.842000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
