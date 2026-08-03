-- job_id: 17787bb8-373d-4309-91e3-8a4cf586f862
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T05:01:59.062000+00:00
-- started: 2026-08-01T05:01:59.148000+00:00
-- ended: 2026-08-01T05:01:59.260000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
