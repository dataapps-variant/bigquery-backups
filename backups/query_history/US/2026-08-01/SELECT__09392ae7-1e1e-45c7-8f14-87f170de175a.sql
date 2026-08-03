-- job_id: 09392ae7-1e1e-45c7-8f14-87f170de175a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T00:03:23.293000+00:00
-- started: 2026-08-01T00:03:23.428000+00:00
-- ended: 2026-08-01T00:03:23.576000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
