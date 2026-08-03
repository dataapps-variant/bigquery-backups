-- job_id: 26f6e399-d272-4c30-8a61-72f510e8cbb3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T22:01:40.249000+00:00
-- started: 2026-08-01T22:01:40.369000+00:00
-- ended: 2026-08-01T22:01:40.481000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
