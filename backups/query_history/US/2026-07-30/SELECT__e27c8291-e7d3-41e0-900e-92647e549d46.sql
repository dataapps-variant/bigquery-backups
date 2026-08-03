-- job_id: e27c8291-e7d3-41e0-900e-92647e549d46
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T18:05:24.397000+00:00
-- started: 2026-07-30T18:05:24.517000+00:00
-- ended: 2026-07-30T18:05:25.060000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
