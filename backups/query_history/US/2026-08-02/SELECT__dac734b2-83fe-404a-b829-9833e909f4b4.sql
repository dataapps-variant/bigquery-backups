-- job_id: dac734b2-83fe-404a-b829-9833e909f4b4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:04:19.646000+00:00
-- started: 2026-08-02T16:04:19.761000+00:00
-- ended: 2026-08-02T16:04:19.890000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
