-- job_id: 2dacb1f0-d222-4394-a942-9a09b44ed8b6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:09:33.986000+00:00
-- started: 2026-08-02T06:09:34.124000+00:00
-- ended: 2026-08-02T06:09:34.352000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
