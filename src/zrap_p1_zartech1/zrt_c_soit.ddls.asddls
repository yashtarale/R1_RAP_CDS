@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection layer for Sales order Item'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZRT_C_SOIT as projection on ZRT_I_SOIT
{
    key Soid,
    key ItemId,
    ProdId,
    Price,
    CurrKey,
    Createdby,
    Createdon,
    Approvedby,
    Approvedon,
    /* Associations */
    _Header : redirected to parent ZRT_ROOT_C_SO // for relation between projection views in parent and child
}
