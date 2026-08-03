-- job_id: 564c6409-3975-4ff5-913c-1940c1bd41f6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:02:48.413000+00:00
-- started: 2026-08-01T06:02:48.547000+00:00
-- ended: 2026-08-01T06:02:48.707000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
