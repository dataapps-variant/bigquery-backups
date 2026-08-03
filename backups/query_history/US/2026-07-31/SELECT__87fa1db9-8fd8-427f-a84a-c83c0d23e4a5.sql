-- job_id: 87fa1db9-8fd8-427f-a84a-c83c0d23e4a5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:03:18.829000+00:00
-- started: 2026-07-31T15:03:18.935000+00:00
-- ended: 2026-07-31T15:03:19.073000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
