@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for customer'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZRT_I_CUST as select from zrt_dt_cust
{
    key cust_id as CustId,
    name as Name,
    comapny_name as ComapnyName,
    country as Country,
    mobile as Mobile,
    creationuser as Creationuser,
    lastchangeduser as Lastchangeduser,
    creationtimestamp as Creationtimestamp,
    changedtimestamp as Changedtimestamp
}

