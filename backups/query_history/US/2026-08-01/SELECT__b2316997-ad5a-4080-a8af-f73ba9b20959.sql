-- job_id: b2316997-ad5a-4080-a8af-f73ba9b20959
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T20:04:32.537000+00:00
-- started: 2026-08-01T20:04:32.660000+00:00
-- ended: 2026-08-01T20:04:32.868000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
