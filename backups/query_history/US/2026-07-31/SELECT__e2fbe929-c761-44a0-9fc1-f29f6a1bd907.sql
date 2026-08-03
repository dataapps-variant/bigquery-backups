-- job_id: e2fbe929-c761-44a0-9fc1-f29f6a1bd907
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T20:02:38.594000+00:00
-- started: 2026-07-31T20:02:38.722000+00:00
-- ended: 2026-07-31T20:02:38.858000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
