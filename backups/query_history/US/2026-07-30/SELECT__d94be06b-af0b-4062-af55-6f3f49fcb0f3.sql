-- job_id: d94be06b-af0b-4062-af55-6f3f49fcb0f3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:09:41.085000+00:00
-- started: 2026-07-30T13:09:41.714000+00:00
-- ended: 2026-07-30T13:09:41.808000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
