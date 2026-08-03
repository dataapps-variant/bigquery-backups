-- job_id: 44338313-300c-41e1-b835-630f831072d3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T22:02:36.032000+00:00
-- started: 2026-08-01T22:02:36.148000+00:00
-- ended: 2026-08-01T22:02:36.257000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
