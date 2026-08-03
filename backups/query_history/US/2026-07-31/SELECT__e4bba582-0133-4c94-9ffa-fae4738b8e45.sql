-- job_id: e4bba582-0133-4c94-9ffa-fae4738b8e45
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T23:06:09.551000+00:00
-- started: 2026-07-31T23:06:09.675000+00:00
-- ended: 2026-07-31T23:06:09.811000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
