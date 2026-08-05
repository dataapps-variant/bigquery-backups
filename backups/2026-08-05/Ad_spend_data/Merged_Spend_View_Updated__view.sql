CREATE VIEW `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`
AS SELECT 
  COALESCE(dim.Channel_Name, base.Channel_name) AS Channel_name,
  base.Date,
  COALESCE(dim.Channel_Type, base.Channel_type) AS Channel_type,
  COALESCE(dim.afid_channel, CAST(base.Channel_code AS INTEGER)) AS Channel_code,
  base.App_name,
  base.Final_URL_suffix_AFID,
  COALESCE(dim.Country_Code, base.Country) AS Country,
  base.Amount,
  base.Source
FROM 
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View` AS base
LEFT JOIN 
  `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS dim
ON 
  base.Final_URL_suffix_AFID = dim.AFID;
