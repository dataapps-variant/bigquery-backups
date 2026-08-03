-- job_id: 366baad9-b776-406b-947b-be12b4088dba
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T20:03:19.985000+00:00
-- started: 2026-07-29T20:03:20.211000+00:00
-- ended: 2026-07-29T20:03:20.714000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
