CLASS lhc_ZRT_Root_I_SO DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZRT_Root_I_SO RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZRT_Root_I_SO RESULT result.
    METHODS validateSalesDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZRT_Root_I_SO~validateSalesDate.

ENDCLASS.

CLASS lhc_ZRT_Root_I_SO IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

*so if i want to check/validate the data when the user enters it i will create and implement this
*it will be like - read entities of <Behaviour_definition_name> in local mode.
*local mode is so that it should not check for any reference or API call, and we are doing it in same class
  METHOD validateSalesDate.

  "we are reading the createdOn field with key field-soid and getting all data in  internal table
  READ ENTITIES OF zrt_root_i_so in LOCAL MODE  " beh def of root interface
  entITY zrt_root_i_so
  FIELDS ( Createdon )  " we can use "ALL FIELDS" if we wangt all fields
  with corrESPONDING #( keys )
  RESULT daTA(lt_result).


  loop at lt_result into data(ls_result).
  if ls_result-Createdon < 20260101064225.
  append value #( %key = ls_result-%key )
    to failed-zrt_root_i_so.

  appEND value #( %key = ls_result-%key
                  %msg = new_message_with_text(
                         severity = if_abap_behv_message=>severity-error
                         text = 'sales date is incorrect'
                         )
                        )
                        TO reported-zrt_root_i_so.

  endif.
  endloop.
  ENDMETHOD.

ENDCLASS.
