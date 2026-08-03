-- job_id: ccde00d4-226b-4188-81c3-fa7bb337e35d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:08:50.755000+00:00
-- started: 2026-08-01T12:08:50.853000+00:00
-- ended: 2026-08-01T12:08:51.287000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
