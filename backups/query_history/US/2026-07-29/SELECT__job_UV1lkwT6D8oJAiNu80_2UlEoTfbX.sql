-- job_id: job_UV1lkwT6D8oJAiNu80_2UlEoTfbX
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:25:17.558000+00:00
-- started: 2026-07-29T12:25:17.649000+00:00
-- ended: 2026-07-29T12:25:17.847000+00:00

SELECT MIN(Date) first_month, MAX(Date) last_month,
  COUNT(DISTINCT Entity) entities, COUNT(DISTINCT Category) categories,
  COUNT(DISTINCT Date) months FROM `variant-finance-data-project.R100.R100_Opex`
