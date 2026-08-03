-- job_id: ff331879-bd34-44f5-8fdc-4ed61a3809e1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T20:07:42.919000+00:00
-- started: 2026-08-01T20:07:43.019000+00:00
-- ended: 2026-08-01T20:07:43.138000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
