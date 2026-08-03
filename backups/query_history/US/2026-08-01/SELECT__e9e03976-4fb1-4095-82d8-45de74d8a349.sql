-- job_id: e9e03976-4fb1-4095-82d8-45de74d8a349
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T05:02:39.700000+00:00
-- started: 2026-08-01T05:02:39.816000+00:00
-- ended: 2026-08-01T05:02:39.974000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
