-- job_id: dd7f64ed-8181-4b26-bf7d-9f0061582c50
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:03:08.115000+00:00
-- started: 2026-07-29T06:03:08.242000+00:00
-- ended: 2026-07-29T06:03:08.374000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
