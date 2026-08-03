-- job_id: a39dc0f8-cfc6-4e88-90f8-39f5c91409f7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T07:02:40.664000+00:00
-- started: 2026-08-02T07:02:40.758000+00:00
-- ended: 2026-08-02T07:02:40.873000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
