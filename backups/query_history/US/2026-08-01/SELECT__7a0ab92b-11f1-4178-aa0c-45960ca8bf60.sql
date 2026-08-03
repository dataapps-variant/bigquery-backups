-- job_id: 7a0ab92b-11f1-4178-aa0c-45960ca8bf60
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T10:04:50.215000+00:00
-- started: 2026-08-01T10:04:50.343000+00:00
-- ended: 2026-08-01T10:04:50.450000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
