-- job_id: 81587611-4400-4035-9d26-f0f9976892ec
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T23:03:04.378000+00:00
-- started: 2026-07-28T23:03:04.492000+00:00
-- ended: 2026-07-28T23:03:04.638000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
