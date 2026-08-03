-- job_id: 1b86d76b-799c-465b-90d3-aab00a953647
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T05:02:27.979000+00:00
-- started: 2026-08-02T05:02:28.068000+00:00
-- ended: 2026-08-02T05:02:28.168000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
