-- job_id: 262d1a14-0c4f-42ce-833a-6a6198ebf8d8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T08:04:20.584000+00:00
-- started: 2026-08-01T08:04:20.708000+00:00
-- ended: 2026-08-01T08:04:20.835000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
