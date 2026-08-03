-- job_id: 2f026764-0470-47e3-93ae-31fdb9617e3a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T01:05:39.493000+00:00
-- started: 2026-07-30T01:05:39.623000+00:00
-- ended: 2026-07-30T01:05:39.737000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
