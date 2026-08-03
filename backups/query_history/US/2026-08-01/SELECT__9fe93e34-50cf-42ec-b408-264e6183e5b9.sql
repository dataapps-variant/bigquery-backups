-- job_id: 9fe93e34-50cf-42ec-b408-264e6183e5b9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T23:02:36.315000+00:00
-- started: 2026-08-01T23:02:36.415000+00:00
-- ended: 2026-08-01T23:02:36.519000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
