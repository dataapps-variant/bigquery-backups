-- job_id: 52fac827-39c0-481a-a8a7-d7cb0dfa7ddd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T01:03:22.333000+00:00
-- started: 2026-08-02T01:03:22.917000+00:00
-- ended: 2026-08-02T01:03:23.952000+00:00


            DELETE FROM `variant-finance-data-project.Sticky_Data.missing_orders`
            WHERE company = 'formsourcellc' AND order_id IN ('1666503')
