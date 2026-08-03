-- job_id: 49dcaef7-5402-4e1a-b215-2dc698399bf8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T02:07:41.491000+00:00
-- started: 2026-07-30T02:07:41.604000+00:00
-- ended: 2026-07-30T02:07:41.732000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
