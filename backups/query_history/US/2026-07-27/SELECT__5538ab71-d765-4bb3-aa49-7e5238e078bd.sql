-- job_id: 5538ab71-d765-4bb3-aa49-7e5238e078bd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T22:03:10.618000+00:00
-- started: 2026-07-27T22:03:10.722000+00:00
-- ended: 2026-07-27T22:03:11.163000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
