-- job_id: aac42813-2012-4e10-a8f4-fbb87a50a4f7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:09:16.622000+00:00
-- started: 2026-07-28T16:09:16.715000+00:00
-- ended: 2026-07-28T16:09:16.808000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
