-- job_id: 63ee7cd1-1fb4-4845-9b01-e52bb32764b4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:03:41.327000+00:00
-- started: 2026-08-02T06:03:41.438000+00:00
-- ended: 2026-08-02T06:03:41.565000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
