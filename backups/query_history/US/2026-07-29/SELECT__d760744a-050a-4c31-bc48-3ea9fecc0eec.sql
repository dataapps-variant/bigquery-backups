-- job_id: d760744a-050a-4c31-bc48-3ea9fecc0eec
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T02:02:39.367000+00:00
-- started: 2026-07-29T02:02:39.500000+00:00
-- ended: 2026-07-29T02:02:39.623000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
