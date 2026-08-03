-- job_id: e10ac711-6586-4da3-a784-5f1cb372455b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:04:38.123000+00:00
-- started: 2026-08-01T12:04:38.222000+00:00
-- ended: 2026-08-01T12:04:38.338000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
