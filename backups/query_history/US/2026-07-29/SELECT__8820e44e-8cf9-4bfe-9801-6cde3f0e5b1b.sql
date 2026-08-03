-- job_id: 8820e44e-8cf9-4bfe-9801-6cde3f0e5b1b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T23:02:30.124000+00:00
-- started: 2026-07-29T23:02:30.251000+00:00
-- ended: 2026-07-29T23:02:30.384000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
