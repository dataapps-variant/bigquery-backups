-- job_id: 3c247507-9795-4d8a-84d4-fdc7bd6ec1df
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:09:24.386000+00:00
-- started: 2026-07-28T12:09:24.508000+00:00
-- ended: 2026-07-28T12:09:24.617000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
