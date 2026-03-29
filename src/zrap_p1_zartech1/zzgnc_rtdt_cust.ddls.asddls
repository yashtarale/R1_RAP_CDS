@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZZGNRTDT_CUST'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZZGNC_RTDT_CUST
  provider contract TRANSACTIONAL_QUERY
  as projection on ZZGNR_RTDT_CUST
  association [1..1] to ZZGNR_RTDT_CUST as _BaseEntity on $projection.CUSTID = _BaseEntity.CUSTID
{
  key CustID,
  Name,
  ComapnyName,
  Country,
  Mobile,
  @Semantics: {
    User.Createdby: true
  }
  Creationuser,
  @Semantics: {
    User.Lastchangedby: true
  }
  Lastchangeduser,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  Creationtimestamp,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  Changedtimestamp,
  _BaseEntity
}
