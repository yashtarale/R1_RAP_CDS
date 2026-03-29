@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZZGNRTDT_CUST'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZZGNR_RTDT_CUST
  as select from ZRT_DT_CUST
{
  key cust_id as CustID,
  name as Name,
  comapny_name as ComapnyName,
  country as Country,
  mobile as Mobile,
  @Semantics.user.createdBy: true
  creationuser as Creationuser,
  @Semantics.user.lastChangedBy: true
  lastchangeduser as Lastchangeduser,
  @Semantics.systemDateTime.createdAt: true
  creationtimestamp as Creationtimestamp,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  changedtimestamp as Changedtimestamp
}
