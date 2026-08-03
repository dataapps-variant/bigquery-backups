-- job_id: c6542bd5-0bbf-4930-984e-01f1d54bdf78
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T07:02:25.437000+00:00
-- started: 2026-07-31T07:02:25.542000+00:00
-- ended: 2026-07-31T07:02:25.648000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
