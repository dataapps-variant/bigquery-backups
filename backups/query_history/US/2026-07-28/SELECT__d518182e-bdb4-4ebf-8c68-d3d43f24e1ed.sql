-- job_id: d518182e-bdb4-4ebf-8c68-d3d43f24e1ed
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T02:04:16.389000+00:00
-- started: 2026-07-28T02:04:16.522000+00:00
-- ended: 2026-07-28T02:04:16.628000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
