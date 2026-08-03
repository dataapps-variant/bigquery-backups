-- job_id: ce0261d1-b751-4590-a202-34d94abef324
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T01:01:55.172000+00:00
-- started: 2026-07-29T01:01:55.305000+00:00
-- ended: 2026-07-29T01:01:55.415000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
