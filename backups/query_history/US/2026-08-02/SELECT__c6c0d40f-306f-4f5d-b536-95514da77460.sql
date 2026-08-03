-- job_id: c6c0d40f-306f-4f5d-b536-95514da77460
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T15:02:06.190000+00:00
-- started: 2026-08-02T15:02:06.287000+00:00
-- ended: 2026-08-02T15:02:06.432000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
