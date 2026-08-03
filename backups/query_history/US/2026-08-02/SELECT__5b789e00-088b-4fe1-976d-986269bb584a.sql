-- job_id: 5b789e00-088b-4fe1-976d-986269bb584a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:02:55.640000+00:00
-- started: 2026-08-02T12:02:55.721000+00:00
-- ended: 2026-08-02T12:02:55.841000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
