@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Typeasting'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZS4_1_Typecasting as select from /dmo/a_travel_d
{
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as fee,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    cast( booking_fee as abap.curr(18,4) ) as bookingfee_18,
    currency_code as CurrencyCode
    
}
