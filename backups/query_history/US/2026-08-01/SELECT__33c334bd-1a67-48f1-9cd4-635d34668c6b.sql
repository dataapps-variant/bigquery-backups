-- job_id: 33c334bd-1a67-48f1-9cd4-635d34668c6b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T01:02:37.554000+00:00
-- started: 2026-08-01T01:02:37.719000+00:00
-- ended: 2026-08-01T01:02:37.855000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
