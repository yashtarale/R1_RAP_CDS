@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'define view entity explore'
@Metadata.ignorePropagatedAnnotations: true

//first observation - no sql view name here
// we cannot see the cds view entity in se11(data dictionary) whereas we can see the cds view(obselete)

define view entity ZS2_1_def_view_entity as select from /dmo/travel_m 
{
key travel_id as TravelId,
agency_id as AgencyId,
customer_id as CustomerId,
begin_date as BeginDate,
end_date as EndDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
booking_fee as BookingFee,
@Semantics.amount.currencyCode: 'CurrencyCode'
total_price as TotalPrice,
currency_code as CurrencyCode,
description as Description,
overall_status as OverallStatus,
created_by as CreatedBy,
created_at as CreatedAt,
last_changed_by as LastChangedBy,
last_changed_at as LastChangedAt
}
//where d.customer_id = '000594'
