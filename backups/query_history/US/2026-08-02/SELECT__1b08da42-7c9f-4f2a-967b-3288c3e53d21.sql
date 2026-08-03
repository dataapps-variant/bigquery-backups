-- job_id: 1b08da42-7c9f-4f2a-967b-3288c3e53d21
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T23:01:19.931000+00:00
-- started: 2026-08-02T23:01:20.072000+00:00
-- ended: 2026-08-02T23:01:20.199000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
