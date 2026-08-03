-- job_id: bf95a372-ddd4-4ffa-838d-72a66ba32ae1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:04:41.506000+00:00
-- started: 2026-07-28T06:04:41.609000+00:00
-- ended: 2026-07-28T06:04:41.983000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
