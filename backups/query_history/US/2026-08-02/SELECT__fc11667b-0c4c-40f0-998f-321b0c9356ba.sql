-- job_id: fc11667b-0c4c-40f0-998f-321b0c9356ba
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:42.026000+00:00
-- started: 2026-08-02T00:09:42.113000+00:00
-- ended: 2026-08-02T00:09:42.271000+00:00

SELECT DISTINCT order_id FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT_Incremental WHERE order_id IS NOT NULL;
