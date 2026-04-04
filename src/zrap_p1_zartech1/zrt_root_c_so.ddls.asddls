@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection layer for sales order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZRT_ROOT_C_SO 
provider contract transactional_query //explicitly added this line to perform all operations
as projection on ZRT_Root_I_SO
association [1..1] to ZRT_I_CUST as _Cust
on ZRT_Root_I_SO.Buyer = _Cust.CustId
{
    key Soid,
    Buyer,
    Createdby,
    Createdon,
    Approvedby,
    Approvedon,
    /* Associations */
    _Item : redirected to composition child ZRT_C_SOIT, // for relation between projection views in parent and child
    _Cust //customer cds entity
}
