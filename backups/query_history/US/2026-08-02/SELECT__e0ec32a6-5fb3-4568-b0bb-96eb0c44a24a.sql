-- job_id: e0ec32a6-5fb3-4568-b0bb-96eb0c44a24a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:04:34.245000+00:00
-- started: 2026-08-02T12:04:34.374000+00:00
-- ended: 2026-08-02T12:04:34.487000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
