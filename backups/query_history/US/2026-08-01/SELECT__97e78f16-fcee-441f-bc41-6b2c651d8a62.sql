-- job_id: 97e78f16-fcee-441f-bc41-6b2c651d8a62
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T10:03:06.691000+00:00
-- started: 2026-08-01T10:03:06.796000+00:00
-- ended: 2026-08-01T10:03:06.955000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
