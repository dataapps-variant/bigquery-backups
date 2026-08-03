-- job_id: b940bc2a-9cc9-436a-aecf-4145f220c9d4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:19:15.006000+00:00
-- started: 2026-08-02T06:19:15.098000+00:00
-- ended: 2026-08-02T06:19:15.244000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
