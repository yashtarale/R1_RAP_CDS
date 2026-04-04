@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for sales order item'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZRT_I_SOIT 
as select from zrt_dt_soit
association to parent ZRT_Root_I_SO as _Header
on $projection.Soid = _Header.Soid
{
    key soid as Soid,
    key item_id as ItemId,
    prod_id as ProdId,
    @Semantics.amount.currencyCode: 'CurrKey'
    price as Price,
    curr_key as CurrKey,
    createdby as Createdby,
    createdon as Createdon,
    approvedby as Approvedby,
    approvedon as Approvedon,
    _Header
}
