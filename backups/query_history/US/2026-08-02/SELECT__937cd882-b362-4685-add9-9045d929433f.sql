-- job_id: 937cd882-b362-4685-add9-9045d929433f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T17:01:29.148000+00:00
-- started: 2026-08-02T17:01:29.263000+00:00
-- ended: 2026-08-02T17:01:29.401000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
