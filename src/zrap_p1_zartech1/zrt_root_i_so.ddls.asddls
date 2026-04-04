@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for SO'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZRT_Root_I_SO as select from zrt_dt_so
composition [1..*] of ZRT_I_SOIT  as _Item  //parent to child relation - compostion with cardinality
{
    key soid as Soid,
    buyer as Buyer,
    createdby as Createdby,
    createdon as Createdon,
    approvedby as Approvedby,
    @Semantics.systemDateTime.lastChangedAt: true
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    approvedon as Approvedon,
    _Item // Make association public
}



// create 4 tables
// customer || product || Sales Order (parent) || sales order Items (child)

//created data definition (Interface views for all 4) with SO as root vew

//parent child relation define when actiation
//SO Int. View is arent so used composition to relate with child table SOItem
//SOItem will have assiciation to parent as it have parent as SO


// create behavior Definition - managed
// create behaviour implementation class

//create the Projection view of root interface view and child interface view(data definition- choose projection iew in option)
//also add relation in between them both parent child projection view

//define the behaviour - New behaviour definition by selecting the Projection view(projection layer)
//create for so Interface view and consumption view (for item not created) 
//no imlementation for projectio view

//create service definition of the SO sonsumption view - ( projection view cha service definition)
//expose the required cds views in it 
//create service binding for the same definition

//create a maping for the fields in behaviour definition of interface root view


//basic app is ready


//create metadata extension for richer UI 
//use cosnumption of root view and creat ME - we can isuse the same view name

//now the app have the metadata extension which show header details
// want to add the customer fcet as well in subscreen
//create metadata extension for customer interface view and link using assiciation with consumtion view of root so view.
//2 things are very important to see the changes is that - 
// 1. in metadata extension expose the view with endusertext label annotation
// 2. add target element in facet which we want to see




//concurrency control to be implemented
//to avoid concurrent data update which will create the issue in data
//we use etag for this

//suppose 2 people open same data ad 2 updated and other person have same tab open and he tried to change data without refreshiing the page which is updated by 1st user 
//it creates the issue where 1st person updated data will also change without knowing by 2nd person

//add below in interface view for the particular field

//    @Semantics.systemDateTime.lastChangedAt: true
//    @Semantics.systemDateTime.localInstanceLastChangedAt: true
//    approvedon as Approvedon,
//    
    
//just add the "etag master <Approvedon>field name" in the behaviour definition of interface root view
// add use etag statement in consumpton view - behaviour def.
//this will enable the etag - concurrency control




//to add a validation on any field or any operation we need to do 
// we will use validation keyword in behavour definition and then write the code in behaviour imp. class
//of root interface view


