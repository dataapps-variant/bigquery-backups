-- job_id: 3064f9cc-5bff-48ee-a65d-7ad32795182f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T18:03:45.031000+00:00
-- started: 2026-07-27T18:03:45.201000+00:00
-- ended: 2026-07-27T18:03:45.331000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
