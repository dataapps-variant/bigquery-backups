-- job_id: 2cabe323-aae6-45ef-b353-d025c0c69f08
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:03:16.440000+00:00
-- started: 2026-07-28T15:03:16.529000+00:00
-- ended: 2026-07-28T15:03:16.690000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
