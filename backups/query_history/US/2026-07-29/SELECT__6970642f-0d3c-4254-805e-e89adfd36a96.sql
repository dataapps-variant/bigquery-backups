-- job_id: 6970642f-0d3c-4254-805e-e89adfd36a96
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T11:05:25.129000+00:00
-- started: 2026-07-29T11:05:25.244000+00:00
-- ended: 2026-07-29T11:05:25.391000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
