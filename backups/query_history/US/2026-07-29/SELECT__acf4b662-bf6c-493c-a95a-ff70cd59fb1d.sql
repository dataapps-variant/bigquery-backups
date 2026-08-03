-- job_id: acf4b662-bf6c-493c-a95a-ff70cd59fb1d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T03:03:37.740000+00:00
-- started: 2026-07-29T03:03:37.857000+00:00
-- ended: 2026-07-29T03:03:37.959000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
