-- job_id: 8a1c0d6c-100e-4bec-adfe-fbb680dbebd3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:06:14.939000+00:00
-- started: 2026-08-02T00:06:15.049000+00:00
-- ended: 2026-08-02T00:06:15.257000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
