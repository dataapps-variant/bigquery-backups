-- job_id: c8409fd6-20b3-4bc1-9737-7b0ea47bcf4b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T22:02:28.941000+00:00
-- started: 2026-07-31T22:02:29.129000+00:00
-- ended: 2026-07-31T22:02:29.284000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
