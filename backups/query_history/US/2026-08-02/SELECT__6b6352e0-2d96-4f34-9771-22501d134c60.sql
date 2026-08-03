-- job_id: 6b6352e0-2d96-4f34-9771-22501d134c60
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:14.806000+00:00
-- started: 2026-08-02T00:09:14.892000+00:00
-- ended: 2026-08-02T00:09:15.061000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'formsourcellc' AND order_id IS NOT NULL
