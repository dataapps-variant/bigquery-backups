-- job_id: 55bc6cfc-0d8e-4558-9acb-6b4d306dc4a4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T10:02:31.312000+00:00
-- started: 2026-08-02T10:02:31.444000+00:00
-- ended: 2026-08-02T10:02:31.735000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
