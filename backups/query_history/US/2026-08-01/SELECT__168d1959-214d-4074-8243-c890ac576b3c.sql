-- job_id: 168d1959-214d-4074-8243-c890ac576b3c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:16:28.363000+00:00
-- started: 2026-08-01T06:16:28.491000+00:00
-- ended: 2026-08-01T06:16:28.707000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
