-- job_id: df568bf9-e295-4451-b3ed-5f2fd8743146
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T05:03:33.987000+00:00
-- started: 2026-08-01T05:03:34.112000+00:00
-- ended: 2026-08-01T05:03:34.303000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
