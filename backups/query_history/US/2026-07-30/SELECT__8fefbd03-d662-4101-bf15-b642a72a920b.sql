-- job_id: 8fefbd03-d662-4101-bf15-b642a72a920b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T20:07:38.931000+00:00
-- started: 2026-07-30T20:07:39.039000+00:00
-- ended: 2026-07-30T20:07:39.137000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
