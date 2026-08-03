-- job_id: f51148bb-38b5-415a-a32d-0b6e95b72e63
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T23:01:25.544000+00:00
-- started: 2026-08-01T23:01:25.669000+00:00
-- ended: 2026-08-01T23:01:25.769000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
