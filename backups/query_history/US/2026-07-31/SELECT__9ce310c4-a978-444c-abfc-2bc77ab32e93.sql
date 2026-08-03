-- job_id: 9ce310c4-a978-444c-abfc-2bc77ab32e93
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:04:51.338000+00:00
-- started: 2026-07-31T06:04:51.468000+00:00
-- ended: 2026-07-31T06:04:51.579000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
