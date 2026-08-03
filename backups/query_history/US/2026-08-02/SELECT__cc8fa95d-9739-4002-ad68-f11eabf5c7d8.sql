-- job_id: cc8fa95d-9739-4002-ad68-f11eabf5c7d8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T22:02:40.548000+00:00
-- started: 2026-08-02T22:02:40.716000+00:00
-- ended: 2026-08-02T22:02:40.841000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
