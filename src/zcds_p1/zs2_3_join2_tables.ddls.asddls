@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join implement'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZS2_3_Join2_tables as select from /dmo/travel_m as tm
inner join /dmo/booking_m as bm
on tm.travel_id = bm.travel_id
{
    key bm.travel_id as TravelId,
    key bm.booking_id as BookingId,
    key tm.travel_id as TM_TravelId,
    bm.booking_date as BookingDate,
    bm.customer_id as CustomerId,
    bm.carrier_id as CarrierId,
    bm.connection_id as ConnectionId,
    bm.flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    bm.flight_price as FlightPrice,
    bm.currency_code as CurrencyCode,
    bm.booking_status as BookingStatus,
    bm.last_changed_at as LastChangedAt,
    tm.agency_id as AgencyId,
    tm.customer_id as tm_CustomerId,
    tm.begin_date as BeginDate,
    tm.end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    tm.booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    tm.total_price as TotalPrice,
    tm.currency_code as tm_CurrencyCode,
    tm.description as Description,
    tm.overall_status as OverallStatus,
    tm.created_by as CreatedBy,
    tm.created_at as CreatedAt,
    tm.last_changed_by as LastChangedBy,
    tm.last_changed_at as tm_LastChangedAt
}
where bm.booking_id = '0001'
