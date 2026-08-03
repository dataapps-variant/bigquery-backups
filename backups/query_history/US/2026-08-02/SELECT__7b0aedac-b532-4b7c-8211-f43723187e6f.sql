-- job_id: 7b0aedac-b532-4b7c-8211-f43723187e6f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T10:04:32.373000+00:00
-- started: 2026-08-02T10:04:32.488000+00:00
-- ended: 2026-08-02T10:04:32.590000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
