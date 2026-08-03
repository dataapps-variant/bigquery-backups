-- job_id: 7fcebc18-fc6f-4ade-b401-1558e7072af7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T07:03:04.040000+00:00
-- started: 2026-07-31T07:03:04.174000+00:00
-- ended: 2026-07-31T07:03:04.304000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
