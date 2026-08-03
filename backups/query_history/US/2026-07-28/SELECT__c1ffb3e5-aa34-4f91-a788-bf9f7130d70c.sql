-- job_id: c1ffb3e5-aa34-4f91-a788-bf9f7130d70c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T19:07:01.307000+00:00
-- started: 2026-07-28T19:07:01.420000+00:00
-- ended: 2026-07-28T19:07:01.546000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
