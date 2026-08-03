-- job_id: d258cde9-265f-4d65-80de-58ef3b0d779a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T09:01:25.571000+00:00
-- started: 2026-08-02T09:01:25.685000+00:00
-- ended: 2026-08-02T09:01:25.787000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
