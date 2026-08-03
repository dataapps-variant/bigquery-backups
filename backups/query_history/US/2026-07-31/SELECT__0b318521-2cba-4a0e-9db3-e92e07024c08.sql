-- job_id: 0b318521-2cba-4a0e-9db3-e92e07024c08
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:04:26.748000+00:00
-- started: 2026-07-31T13:04:26.841000+00:00
-- ended: 2026-07-31T13:04:26.993000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
