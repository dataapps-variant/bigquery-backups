-- job_id: f5316ab6-e054-455a-bdfe-49213ef6bb74
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:10:35.231000+00:00
-- started: 2026-07-30T06:10:35.477000+00:00
-- ended: 2026-07-30T06:10:35.668000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
