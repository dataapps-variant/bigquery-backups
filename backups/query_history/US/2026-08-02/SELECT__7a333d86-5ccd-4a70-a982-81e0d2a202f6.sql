-- job_id: 7a333d86-5ccd-4a70-a982-81e0d2a202f6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:04:23.610000+00:00
-- started: 2026-08-02T00:04:23.702000+00:00
-- ended: 2026-08-02T00:04:23.877000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
