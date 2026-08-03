-- job_id: 9b1ae59d-49b9-465c-80a4-dc8446b9fd86
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:08:15.231000+00:00
-- started: 2026-07-28T06:08:15.342000+00:00
-- ended: 2026-07-28T06:08:15.513000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
