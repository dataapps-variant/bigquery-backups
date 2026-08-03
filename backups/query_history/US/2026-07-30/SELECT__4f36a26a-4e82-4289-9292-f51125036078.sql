-- job_id: 4f36a26a-4e82-4289-9292-f51125036078
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T04:07:59.677000+00:00
-- started: 2026-07-30T04:07:59.789000+00:00
-- ended: 2026-07-30T04:07:59.925000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
