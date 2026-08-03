-- job_id: 0c51c9b7-ef15-44fa-a978-ce2ba5dbb9d8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T21:01:57.437000+00:00
-- started: 2026-07-28T21:01:57.542000+00:00
-- ended: 2026-07-28T21:01:57.690000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
