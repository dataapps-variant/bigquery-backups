-- job_id: d1bb14b5-cb77-4daa-9902-e47936f63e0d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:13:46.589000+00:00
-- started: 2026-08-01T13:13:46.715000+00:00
-- ended: 2026-08-01T13:13:46.858000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
