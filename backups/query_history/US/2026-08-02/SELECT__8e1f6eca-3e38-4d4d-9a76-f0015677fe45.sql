-- job_id: 8e1f6eca-3e38-4d4d-9a76-f0015677fe45
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T18:02:58.850000+00:00
-- started: 2026-08-02T18:02:58.964000+00:00
-- ended: 2026-08-02T18:02:59.088000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
