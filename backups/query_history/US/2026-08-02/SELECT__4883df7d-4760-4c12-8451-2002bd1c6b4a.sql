-- job_id: 4883df7d-4760-4c12-8451-2002bd1c6b4a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:18:16.128000+00:00
-- started: 2026-08-02T06:18:16.225000+00:00
-- ended: 2026-08-02T06:18:16.402000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
