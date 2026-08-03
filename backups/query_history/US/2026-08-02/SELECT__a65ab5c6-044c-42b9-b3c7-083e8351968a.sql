-- job_id: a65ab5c6-044c-42b9-b3c7-083e8351968a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:09:03.665000+00:00
-- started: 2026-08-02T06:09:03.793000+00:00
-- ended: 2026-08-02T06:09:04.028000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
