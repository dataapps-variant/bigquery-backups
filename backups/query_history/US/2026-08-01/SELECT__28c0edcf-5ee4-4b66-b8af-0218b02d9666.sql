-- job_id: 28c0edcf-5ee4-4b66-b8af-0218b02d9666
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T07:02:24.507000+00:00
-- started: 2026-08-01T07:02:24.627000+00:00
-- ended: 2026-08-01T07:02:24.719000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
