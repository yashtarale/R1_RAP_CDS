CLASS zcl_bs_bgpf_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "structure and table type of DB table
    TYPES ts_data TYPE zbs_dmo_bgpf.
    TYPES tt_data TYPE STANDARD TABLE OF ts_data WITH EMPTY KEY.

    METHODS add
      IMPORTING is_data TYPE ts_data
      RAISING
                cx_uuid_error.

    METHODS save
      IMPORTING id_commit TYPE abap_bool.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA mt_data TYPE tt_data. "standard table of DB table

ENDCLASS.



CLASS zcl_bs_bgpf_data IMPLEMENTATION.

  METHOD add.
   "used to add the data into table
    WAIT UP TO 1 SECONDS.

    DATA(ls_data) = is_data.
    ls_data-identifier   = cl_system_uuid=>create_uuid_x16_static( ).
    ls_data-created_from = cl_abap_context_info=>get_user_alias( ).
    ls_data-created_at   = utclong_current( ).

    INSERT ls_data INTO TABLE mt_data.   " data is now inside this mt_data in the class
  ENDMETHOD.

  METHOD save.
  "used to add he data from internal table to database table.
    INSERT zdb_table1y FROM TABLE @mt_data.

    IF id_commit = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.








