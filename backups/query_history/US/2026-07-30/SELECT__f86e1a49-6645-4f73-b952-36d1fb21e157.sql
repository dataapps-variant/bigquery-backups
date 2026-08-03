-- job_id: f86e1a49-6645-4f73-b952-36d1fb21e157
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:11:08.452000+00:00
-- started: 2026-07-30T06:11:08.529000+00:00
-- ended: 2026-07-30T06:11:08.748000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
