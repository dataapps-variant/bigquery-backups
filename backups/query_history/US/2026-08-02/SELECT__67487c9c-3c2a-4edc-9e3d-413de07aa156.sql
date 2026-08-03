-- job_id: 67487c9c-3c2a-4edc-9e3d-413de07aa156
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T11:06:21.730000+00:00
-- started: 2026-08-02T11:06:21.841000+00:00
-- ended: 2026-08-02T11:06:21.950000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
