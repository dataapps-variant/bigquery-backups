-- job_id: 9bf72117-f1ba-4ba5-9757-7fe405b9f198
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:01:20.283000+00:00
-- started: 2026-08-02T16:01:20.412000+00:00
-- ended: 2026-08-02T16:01:20.538000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
