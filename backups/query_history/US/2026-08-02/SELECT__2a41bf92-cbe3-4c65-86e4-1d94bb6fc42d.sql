-- job_id: 2a41bf92-cbe3-4c65-86e4-1d94bb6fc42d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T05:03:58.308000+00:00
-- started: 2026-08-02T05:03:58.389000+00:00
-- ended: 2026-08-02T05:03:58.574000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
