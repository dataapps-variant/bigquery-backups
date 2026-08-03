-- job_id: d68d75e9-24d6-4d4e-85be-967c41065b2d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T01:03:26.860000+00:00
-- started: 2026-08-01T01:03:27.024000+00:00
-- ended: 2026-08-01T01:03:27.129000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
