-- job_id: 2954be11-9ced-4cf6-922a-3dd9fad32691
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T04:04:40.465000+00:00
-- started: 2026-08-02T04:04:40.616000+00:00
-- ended: 2026-08-02T04:04:40.723000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
