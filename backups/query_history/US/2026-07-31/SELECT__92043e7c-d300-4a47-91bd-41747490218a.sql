-- job_id: 92043e7c-d300-4a47-91bd-41747490218a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:13:13.057000+00:00
-- started: 2026-07-31T06:13:13.144000+00:00
-- ended: 2026-07-31T06:13:13.390000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
