@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Product'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZRT_I_PROD as select from zrt_dt_prod
{
    key prod_id as ProdId,
    descpt as Descpt,
    price as Price,
    curr_key as CurrKey
}
