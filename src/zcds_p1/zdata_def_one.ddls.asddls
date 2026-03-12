@AbapCatalog.sqlViewName: 'ZDEF_ONE_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data fefinition one'
@Metadata.ignorePropagatedAnnotations: true
define view Zdata_def_one as select from zdt_one
{
key customer_id as CustomerId,
name as Name,
city as City,
created_on as CreatedOn
}
