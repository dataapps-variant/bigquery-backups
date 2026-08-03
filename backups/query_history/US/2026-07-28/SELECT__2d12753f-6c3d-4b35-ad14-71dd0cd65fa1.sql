-- job_id: 2d12753f-6c3d-4b35-ad14-71dd0cd65fa1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T03:01:51.466000+00:00
-- started: 2026-07-28T03:01:51.697000+00:00
-- ended: 2026-07-28T03:01:51.815000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
