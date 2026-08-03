-- job_id: 12d3aa13-a7ce-48e4-a43b-b89446c166a1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T03:03:06.903000+00:00
-- started: 2026-08-01T03:03:07.022000+00:00
-- ended: 2026-08-01T03:03:07.137000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
