-- job_id: 912503a8-ca42-4109-91a2-2b5a055d6dd5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T21:06:00.194000+00:00
-- started: 2026-07-27T21:06:00.320000+00:00
-- ended: 2026-07-27T21:06:00.440000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
