-- job_id: 95ed5dec-1183-4a38-940d-d5d2aa8c987c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T18:04:34.198000+00:00
-- started: 2026-07-29T18:04:34.321000+00:00
-- ended: 2026-07-29T18:04:34.415000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
