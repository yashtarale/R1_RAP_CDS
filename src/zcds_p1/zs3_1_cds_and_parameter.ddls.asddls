@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'parameter for cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZS3_1_CDS_and_Parameter with parameters 
    p_agencyid : /dmo/agency_id,      //ex: 070046
    
    @Environment.systemField: #SYSTEM_DATE  //system variable provide as date and the field wil not be mandatory
    p_date : abap.dats
    
    as select from /dmo/travel_m 
    
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    
    //if you want to see the arameter in utput as well then we can use below
    $parameters.p_date as date_entered       
     
} 
where agency_id = $parameters.p_agencyid
and begin_date < $parameters.p_date


