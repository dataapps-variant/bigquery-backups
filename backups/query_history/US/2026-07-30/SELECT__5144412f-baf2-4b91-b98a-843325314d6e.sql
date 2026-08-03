-- job_id: 5144412f-baf2-4b91-b98a-843325314d6e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:09:34.359000+00:00
-- started: 2026-07-30T12:09:34.485000+00:00
-- ended: 2026-07-30T12:09:34.638000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
