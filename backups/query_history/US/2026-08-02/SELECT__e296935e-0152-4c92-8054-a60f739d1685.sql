-- job_id: e296935e-0152-4c92-8054-a60f739d1685
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:05:14.822000+00:00
-- started: 2026-08-02T16:05:14.912000+00:00
-- ended: 2026-08-02T16:05:15.029000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
