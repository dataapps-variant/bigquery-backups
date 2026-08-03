-- job_id: 3e433062-9729-486b-a928-247ee3b89d1a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T10:01:52.008000+00:00
-- started: 2026-08-01T10:01:52.125000+00:00
-- ended: 2026-08-01T10:01:52.269000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
