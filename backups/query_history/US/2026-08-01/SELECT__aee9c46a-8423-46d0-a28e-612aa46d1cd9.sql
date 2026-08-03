-- job_id: aee9c46a-8423-46d0-a28e-612aa46d1cd9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T08:05:22.258000+00:00
-- started: 2026-08-01T08:05:22.339000+00:00
-- ended: 2026-08-01T08:05:22.471000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
