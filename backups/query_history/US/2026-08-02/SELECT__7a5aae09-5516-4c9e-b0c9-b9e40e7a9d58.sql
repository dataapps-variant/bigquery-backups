-- job_id: 7a5aae09-5516-4c9e-b0c9-b9e40e7a9d58
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T13:04:16.733000+00:00
-- started: 2026-08-02T13:04:16.893000+00:00
-- ended: 2026-08-02T13:04:17.020000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
