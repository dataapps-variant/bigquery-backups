-- job_id: 157476ec-b329-4545-b0b7-180774cf2275
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:04:45.786000+00:00
-- started: 2026-07-30T09:04:45.899000+00:00
-- ended: 2026-07-30T09:04:46.026000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
