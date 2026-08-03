-- job_id: d75f8666-c0bf-4c74-8e66-c8b816a6375d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T22:05:31.830000+00:00
-- started: 2026-07-29T22:05:32.058000+00:00
-- ended: 2026-07-29T22:05:32.177000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
