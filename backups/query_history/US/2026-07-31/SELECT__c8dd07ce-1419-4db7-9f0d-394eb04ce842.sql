-- job_id: c8dd07ce-1419-4db7-9f0d-394eb04ce842
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T00:06:30.938000+00:00
-- started: 2026-07-31T00:06:31.058000+00:00
-- ended: 2026-07-31T00:06:31.175000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
