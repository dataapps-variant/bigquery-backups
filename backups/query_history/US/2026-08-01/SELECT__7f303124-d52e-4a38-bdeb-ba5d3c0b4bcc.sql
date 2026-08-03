-- job_id: 7f303124-d52e-4a38-bdeb-ba5d3c0b4bcc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T17:01:04.077000+00:00
-- started: 2026-08-01T17:01:04.184000+00:00
-- ended: 2026-08-01T17:01:04.308000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
