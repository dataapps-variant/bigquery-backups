-- job_id: 9d50ee10-2cce-4115-b329-767f337bad34
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:04:52.449000+00:00
-- started: 2026-08-01T13:04:52.576000+00:00
-- ended: 2026-08-01T13:04:52.699000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
