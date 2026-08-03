-- job_id: 10bfb7b8-9be0-4ac2-a8af-7d42434a375c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T10:03:21.411000+00:00
-- started: 2026-07-29T10:03:21.495000+00:00
-- ended: 2026-07-29T10:03:21.618000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
