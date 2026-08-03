-- job_id: 13c7d5b6-2ed1-477a-bb9e-7cd082976977
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T18:02:33.094000+00:00
-- started: 2026-08-01T18:02:33.218000+00:00
-- ended: 2026-08-01T18:02:33.344000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
