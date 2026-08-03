-- job_id: 6e1f543b-79d9-4075-983d-858fc4373778
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T04:04:40.025000+00:00
-- started: 2026-07-31T04:04:40.154000+00:00
-- ended: 2026-07-31T04:04:40.290000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
