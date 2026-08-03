-- job_id: ce450c6c-9525-4874-924e-f05a2b26a9b0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T05:03:12.771000+00:00
-- started: 2026-07-29T05:03:12.859000+00:00
-- ended: 2026-07-29T05:03:13.021000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
