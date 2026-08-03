-- job_id: 1636092f-d11f-4788-984f-b01524a3e180
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T03:08:11.657000+00:00
-- started: 2026-07-29T03:08:11.764000+00:00
-- ended: 2026-07-29T03:08:11.899000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
