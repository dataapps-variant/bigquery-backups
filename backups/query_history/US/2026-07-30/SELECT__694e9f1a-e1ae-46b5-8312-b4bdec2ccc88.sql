-- job_id: 694e9f1a-e1ae-46b5-8312-b4bdec2ccc88
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T04:06:52.437000+00:00
-- started: 2026-07-30T04:06:52.712000+00:00
-- ended: 2026-07-30T04:06:52.827000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
