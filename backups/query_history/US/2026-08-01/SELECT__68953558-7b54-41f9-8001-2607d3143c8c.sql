-- job_id: 68953558-7b54-41f9-8001-2607d3143c8c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:05:32.582000+00:00
-- started: 2026-08-01T06:05:32.726000+00:00
-- ended: 2026-08-01T06:05:32.856000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
