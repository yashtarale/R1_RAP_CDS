CLASS zcl_rt_load_test_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

  CLASS-METHODS:
      insert_customers,
      insert_products,
      insert_so_header,
      insert_so_items,
      delete_old_data.

    CLASS-DATA:
      gv_soid_1 TYPE sysuuid_x16,
      gv_soid_2 TYPE sysuuid_x16,
      gv_soid_3 TYPE sysuuid_x16.

ENDCLASS.



CLASS zcl_rt_load_test_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  TRY.

        "Generate fixed UUIDs for test SOs
        gv_soid_1 = cl_system_uuid=>create_uuid_x16_static( ).
        gv_soid_2 = cl_system_uuid=>create_uuid_x16_static( ).
        gv_soid_3 = cl_system_uuid=>create_uuid_x16_static( ).

        delete_old_data( ).
        insert_customers( ).
        insert_products( ).
        insert_so_header( ).
        insert_so_items( ).

        COMMIT WORK.

        out->write( 'Test data inserted successfully into all 4 tables.' ).
        out->write( |SOID 1: { gv_soid_1 }| ).
        out->write( |SOID 2: { gv_soid_2 }| ).
        out->write( |SOID 3: { gv_soid_3 }| ).

      CATCH cx_root INTO DATA(lx_root).
        ROLLBACK WORK.
        out->write( 'Error while inserting data:' ).
        out->write( lx_root->get_text( ) ).

    ENDTRY.

  ENDMETHOD.


  METHOD delete_old_data.

    "Delete child first, then parent
    DELETE FROM zrt_dt_soit.
    DELETE FROM zrt_dt_so.
    DELETE FROM zrt_dt_prod.
    DELETE FROM zrt_dt_cust.

  ENDMETHOD.


  METHOD insert_customers.

    DATA lt_cust TYPE STANDARD TABLE OF zrt_dt_cust WITH EMPTY KEY.
    DATA lv_tstmp TYPE timestampl.

    GET TIME STAMP FIELD lv_tstmp.

    lt_cust = VALUE #(
      ( cust_id = 'CUST000001'
        name = 'RAVI'
        comapny_name = 'TCS'
        country = 'IN'
        mobile = '9876543210'
        creationuser = sy-uname
        lastchangeduser = sy-uname
        creationtimestamp = lv_tstmp
        changedtimestamp = lv_tstmp )

      ( cust_id = 'CUST000002'
        name = 'AMIT'
        comapny_name = 'INFY'
        country = 'IN'
        mobile = '9876500001'
        creationuser = sy-uname
        lastchangeduser = sy-uname
        creationtimestamp = lv_tstmp
        changedtimestamp = lv_tstmp )

      ( cust_id = 'CUST000003'
        name = 'NEHA'
        comapny_name = 'WIPRO'
        country = 'IN'
        mobile = '9876500002'
        creationuser = sy-uname
        lastchangeduser = sy-uname
        creationtimestamp = lv_tstmp
        changedtimestamp = lv_tstmp )

      ( cust_id = 'CUST000004'
        name = 'PRIYA'
        comapny_name = 'HCL'
        country = 'IN'
        mobile = '9876500003'
        creationuser = sy-uname
        lastchangeduser = sy-uname
        creationtimestamp = lv_tstmp
        changedtimestamp = lv_tstmp )

      ( cust_id = 'CUST000005'
        name = 'ARJUN'
        comapny_name = 'IBM'
        country = 'IN'
        mobile = '9876500004'
        creationuser = sy-uname
        lastchangeduser = sy-uname
        creationtimestamp = lv_tstmp
        changedtimestamp = lv_tstmp )
    ).

    INSERT zrt_dt_cust FROM TABLE @lt_cust.

  ENDMETHOD.


  METHOD insert_products.

    DATA lt_prod TYPE STANDARD TABLE OF zrt_dt_prod WITH EMPTY KEY.

    lt_prod = VALUE #(
      ( prod_id = 'P0000000000000001' descpt = 'Laptop Dell'         price = '55000.00' curr_key = 'INR' )
      ( prod_id = 'P0000000000000002' descpt = 'Apple iPhone 15'     price = '79999.00' curr_key = 'INR' )
      ( prod_id = 'P0000000000000003' descpt = 'Samsung Galaxy S24'  price = '74999.00' curr_key = 'INR' )
      ( prod_id = 'P0000000000000004' descpt = 'Sony Headphones'      price = '24999.00' curr_key = 'INR' )
      ( prod_id = 'P0000000000000005' descpt = 'Logitech Mouse'       price = '1299.00'  curr_key = 'INR' )
    ).

    INSERT zrt_dt_prod FROM TABLE @lt_prod.

  ENDMETHOD.


  METHOD insert_so_header.

    DATA lt_so TYPE STANDARD TABLE OF zrt_dt_so WITH EMPTY KEY.
    DATA lv_ts TYPE timestamp.

    GET TIME STAMP FIELD lv_ts.

    lt_so = VALUE #(
      ( soid = gv_soid_1
        buyer = 'CUST000001'
        createdby = sy-uname
        createdon = lv_ts
        approvedby = sy-uname
        approvedon = lv_ts )

      ( soid = gv_soid_2
        buyer = 'CUST000002'
        createdby = sy-uname
        createdon = lv_ts
        approvedby = sy-uname
        approvedon = lv_ts )

      ( soid = gv_soid_3
        buyer = 'CUST000003'
        createdby = sy-uname
        createdon = lv_ts
        approvedby = sy-uname
        approvedon = lv_ts )
    ).

    INSERT zrt_dt_so FROM TABLE @lt_so.

  ENDMETHOD.


  METHOD insert_so_items.

    DATA lt_soit TYPE STANDARD TABLE OF zrt_dt_soit WITH EMPTY KEY.
    DATA lv_ts TYPE timestamp.

    GET TIME STAMP FIELD lv_ts.

    lt_soit = VALUE #(
      ( soid = gv_soid_1 item_id = '0000000001' prod_id = 'P0000000000000001' price = '55000.00' curr_key = 'INR'
        createdby = sy-uname createdon = lv_ts approvedby = sy-uname approvedon = lv_ts )

      ( soid = gv_soid_1 item_id = '0000000002' prod_id = 'P0000000000000005' price = '1299.00' curr_key = 'INR'
        createdby = sy-uname createdon = lv_ts approvedby = sy-uname approvedon = lv_ts )

      ( soid = gv_soid_2 item_id = '0000000001' prod_id = 'P0000000000000002' price = '79999.00' curr_key = 'INR'
        createdby = sy-uname createdon = lv_ts approvedby = sy-uname approvedon = lv_ts )

      ( soid = gv_soid_2 item_id = '0000000002' prod_id = 'P0000000000000004' price = '24999.00' curr_key = 'INR'
        createdby = sy-uname createdon = lv_ts approvedby = sy-uname approvedon = lv_ts )

      ( soid = gv_soid_3 item_id = '0000000001' prod_id = 'P0000000000000003' price = '74999.00' curr_key = 'INR'
        createdby = sy-uname createdon = lv_ts approvedby = sy-uname approvedon = lv_ts )
    ).

    INSERT zrt_dt_soit FROM TABLE @lt_soit.

  ENDMETHOD.

ENDCLASS.
