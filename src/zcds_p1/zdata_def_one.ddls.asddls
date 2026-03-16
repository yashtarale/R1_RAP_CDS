@AbapCatalog.sqlViewName: 'ZDEF_ONE_VIEW'            // sql view name
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data fefinition one'
@Metadata.ignorePropagatedAnnotations: true

define view Zdata_def_one as select from zdt_one   // cds view name
//always  use cds view name and not sqlview name(to reduce extra step in code push down)
//reason: if we use sql view then with that it will find the cds view name and then fetch the data- so its a extra step
// follow code push down

{
key customer_id as CustomerId,
name as Name,
city as City,
created_on as CreatedOn
}

//cds view is obselete 
//cds view entity introduced in ABAP release 7.55
// so now in new we dont have the sql view name and its not needed as well                              
