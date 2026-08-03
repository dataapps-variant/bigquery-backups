-- job_id: b0667481-62eb-4718-8845-01b37cc5b7ad
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T04:03:58.554000+00:00
-- started: 2026-07-29T04:03:58.647000+00:00
-- ended: 2026-07-29T04:03:58.757000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
