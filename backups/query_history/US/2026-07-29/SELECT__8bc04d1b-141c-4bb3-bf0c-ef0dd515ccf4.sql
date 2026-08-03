-- job_id: 8bc04d1b-141c-4bb3-bf0c-ef0dd515ccf4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T00:02:00.649000+00:00
-- started: 2026-07-29T00:02:00.850000+00:00
-- ended: 2026-07-29T00:02:00.978000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
