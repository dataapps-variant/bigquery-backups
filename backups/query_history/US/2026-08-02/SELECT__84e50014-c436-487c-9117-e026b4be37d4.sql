-- job_id: 84e50014-c436-487c-9117-e026b4be37d4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T14:08:56.600000+00:00
-- started: 2026-08-02T14:08:56.778000+00:00
-- ended: 2026-08-02T14:08:56.887000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
