-- job_id: e7c0d3c7-c3ca-4b41-888e-899cac3ca90e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T09:03:31.689000+00:00
-- started: 2026-08-02T09:03:31.791000+00:00
-- ended: 2026-08-02T09:03:31.935000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
