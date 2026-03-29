@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'studet Interface view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_STUDENT_BG as 
    select from zstudent_bgpf 
{
    
     key roll_number,
      name
}
