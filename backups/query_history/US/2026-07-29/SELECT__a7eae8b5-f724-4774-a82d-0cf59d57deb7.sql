-- job_id: a7eae8b5-f724-4774-a82d-0cf59d57deb7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T03:02:11.437000+00:00
-- started: 2026-07-29T03:02:11.546000+00:00
-- ended: 2026-07-29T03:02:11.697000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
