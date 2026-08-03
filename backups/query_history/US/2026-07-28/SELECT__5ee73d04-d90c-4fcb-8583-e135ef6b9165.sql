-- job_id: 5ee73d04-d90c-4fcb-8583-e135ef6b9165
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T20:07:46.790000+00:00
-- started: 2026-07-28T20:07:46.889000+00:00
-- ended: 2026-07-28T20:07:46.998000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
