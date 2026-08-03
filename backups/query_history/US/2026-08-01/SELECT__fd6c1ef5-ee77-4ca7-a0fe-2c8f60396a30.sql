-- job_id: fd6c1ef5-ee77-4ca7-a0fe-2c8f60396a30
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:07:50.606000+00:00
-- started: 2026-08-01T13:07:50.728000+00:00
-- ended: 2026-08-01T13:07:50.838000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
