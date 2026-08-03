-- job_id: 8a111864-1c9b-4787-accb-6c523fc42713
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T20:04:03.116000+00:00
-- started: 2026-07-31T20:04:03.274000+00:00
-- ended: 2026-07-31T20:04:03.388000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
