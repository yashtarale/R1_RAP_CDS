@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Group By'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZS3_2_CDS_GroupBY as select from /dmo/travel_m
{
    customer_id as customer,
    currency_code as currency_code,
    @Semantics.amount.currencyCode: 'currency_code'
    sum(total_price) as total_price

}
group by currency_code,customer_id
having sum(total_price) > 1

//for each customer fetch total price in each currency
//group by currency and total price should be > 1
