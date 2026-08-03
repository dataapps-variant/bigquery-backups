-- job_id: efd75e62-012e-4b59-840c-1c253c3fc3e5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:12:56.047000+00:00
-- started: 2026-07-31T16:12:56.150000+00:00
-- ended: 2026-07-31T16:12:56.273000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
