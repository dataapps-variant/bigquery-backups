CREATE VIEW `variant-finance-data-project.icarus_chargebee.Spend_Split`
AS SELECT *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_Platform_TBL`
WHERE Platform = 'Chargebee';
