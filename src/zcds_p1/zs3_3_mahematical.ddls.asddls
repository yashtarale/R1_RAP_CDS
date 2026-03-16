@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'math'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZS3_3_Mahematical as select from /dmo/travel_m 
{

@Semantics.amount.currencyCode: 'CurrencyCode'
total_price as TotalPrice,
currency_code as Currencycode,
@Semantics.amount.currencyCode: 'CurrencyCode'
round(total_price, 0) as math_rounding,
//ceil( total_price) as ceiling_value,
//floor(total_price) as floor_vaue,
@Semantics.amount.currencyCode: 'CurrencyCode'
abs(total_price) as absolute_val

// more like mod(modulus), averageand more
}
