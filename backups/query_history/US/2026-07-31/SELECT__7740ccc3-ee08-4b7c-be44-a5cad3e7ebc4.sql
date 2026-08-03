-- job_id: 7740ccc3-ee08-4b7c-be44-a5cad3e7ebc4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:06:56.392000+00:00
-- started: 2026-07-31T06:06:56.616000+00:00
-- ended: 2026-07-31T06:06:56.808000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
