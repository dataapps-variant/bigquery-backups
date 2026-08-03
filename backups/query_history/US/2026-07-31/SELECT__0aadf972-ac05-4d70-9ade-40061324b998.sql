-- job_id: 0aadf972-ac05-4d70-9ade-40061324b998
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T04:04:24.376000+00:00
-- started: 2026-07-31T04:04:24.549000+00:00
-- ended: 2026-07-31T04:04:24.673000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
