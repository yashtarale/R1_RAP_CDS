@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'assiciation 1'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZS2_4_Association as select from /dmo/travel_m as tm
association [1..*] to /dmo/booking_m as _bm
on tm.travel_id = _bm.travel_id
{
    tm.travel_id,
    tm.agency_id,
    _bm.booking_id,
    _bm.booking_status,
    _bm                    //expose the association 
}
