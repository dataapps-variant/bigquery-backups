-- job_id: b769ba51-b3a6-4c9d-a8a6-3ba0b87e23f1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T21:07:38.943000+00:00
-- started: 2026-08-02T21:07:39.058000+00:00
-- ended: 2026-08-02T21:07:39.173000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
