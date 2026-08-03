-- job_id: f983771e-8b01-4fe2-be6f-5ac35337b1ec
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T01:02:05.944000+00:00
-- started: 2026-07-28T01:02:06.052000+00:00
-- ended: 2026-07-28T01:02:06.217000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
