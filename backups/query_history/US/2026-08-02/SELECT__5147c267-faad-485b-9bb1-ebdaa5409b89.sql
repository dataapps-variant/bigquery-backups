-- job_id: 5147c267-faad-485b-9bb1-ebdaa5409b89
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T14:07:28.317000+00:00
-- started: 2026-08-02T14:07:28.447000+00:00
-- ended: 2026-08-02T14:07:28.553000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
