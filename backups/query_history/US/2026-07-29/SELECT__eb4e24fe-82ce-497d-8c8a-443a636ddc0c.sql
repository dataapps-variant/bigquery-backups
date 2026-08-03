-- job_id: eb4e24fe-82ce-497d-8c8a-443a636ddc0c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:05:05.280000+00:00
-- started: 2026-07-29T06:05:05.388000+00:00
-- ended: 2026-07-29T06:05:05.700000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
