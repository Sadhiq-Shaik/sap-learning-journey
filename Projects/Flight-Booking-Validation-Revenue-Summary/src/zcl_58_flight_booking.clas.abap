CLASS zcl_58_flight_booking DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.



  TYPES: BEGIN OF ty_revenue_summary,

         carrier_id       TYPE /dmo/carrier_id,
         currency         TYPE c LENGTH 3,
         passenger_count  TYPE i,
         revenue          TYPE p LENGTH 8 DECIMALS 2,

       END OF ty_revenue_summary.

TYPES tt_revenue_summary TYPE TABLE OF ty_revenue_summary.

    TYPES: BEGIN OF ty_booking,

             booking_id      TYPE c LENGTH 10,
             passenger_name  TYPE string,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             flight_date     TYPE d,
             passenger_count TYPE i,
             fare            TYPE p LENGTH 8 DECIMALS 2,
             currency        TYPE c LENGTH 3,
             status          TYPE c LENGTH 1,

           END OF ty_booking.

    TYPES tt_bookings TYPE TABLE OF ty_booking.


    TYPES: BEGIN OF ty_validation_result,

             booking_id           TYPE c LENGTH 10,
             passenger_name       TYPE string,
             carrier_id           TYPE /dmo/carrier_id,
             passenger_count      TYPE i,
             fare                 TYPE p LENGTH 8 DECIMALS 2,
             currency             TYPE c LENGTH 3,
             status               TYPE c LENGTH 1,
             result               TYPE c LENGTH 1,
             rejection_reason     TYPE string,
             revenue_eligibility  TYPE c LENGTH 1,
             revenue              TYPE p LENGTH 8 DECIMALS 2,

           END OF ty_validation_result.

    TYPES tt_validation_results TYPE TABLE OF ty_validation_result.

    TYPES ty_booking_id TYPE  c LENGTH 10.
    TYPES tt_booking_ids TYPE TABLE OF ty_booking_id.



  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_58_flight_booking IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA bookings TYPE tt_bookings.
  DATA booking  TYPE ty_booking.


  DATA validation_results TYPE tt_validation_results.
  DATA validation_result  TYPE ty_validation_result.

  DATA processed_booking_ids TYPE tt_booking_ids.
  DATA processed_booking_id  TYPE c LENGTH 10.

  DATA revenue_summary TYPE tt_revenue_summary.
  DATA revenue_line    TYPE ty_revenue_summary.

  DATA total_bookings            TYPE i.
  DATA valid_bookings            TYPE i.
  DATA rejected_bookings         TYPE i.
  DATA cancelled_bookings        TYPE i.
  DATA revenue_eligible_bookings TYPE i.

            "First business record
            booking-booking_id      = 'B001'.
            booking-passenger_name  = 'PASSENGER 1'.
            booking-carrier_id      = 'LH'.
            booking-connection_id   = '0400'.
            booking-flight_date     = '20261110'.
            booking-passenger_count = 1.
            booking-fare            = '450.00'.
            booking-currency        = 'EUR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.

            CLEAR booking.

            booking-booking_id      = 'B002'.
            booking-passenger_name  = 'PASSENGER 2'.
            booking-carrier_id      = 'LH'.
            booking-connection_id   = '0400'.
            booking-flight_date     = '20261110'.
            booking-passenger_count = 2.
            booking-fare            = '0.00'.
            booking-currency        = 'EUR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B003'.
            booking-passenger_name  = 'PASSENGER 3'.
            booking-carrier_id      = 'AI'.
            booking-connection_id   = '0101'.
            booking-flight_date     = '20261112'.
            booking-passenger_count = 2.
            booking-fare            = '5200.00'.
            booking-currency        = 'INR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B004'.
            booking-passenger_name  = 'PASSENGER 4'.
            booking-carrier_id      = 'LH'.
            booking-connection_id   = '0402'.
            booking-flight_date     = '20261115'.
            booking-passenger_count = 3.
            booking-fare            = '600.00'.
            booking-currency        = 'USD'.
            booking-status          = 'C'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B005'.
            booking-passenger_name  = 'PASSENGER 5'.
            booking-carrier_id      = 'AI'.
            booking-connection_id   = '0102'.
            booking-flight_date     = '20261118'.
            booking-passenger_count = 1.
            booking-fare            = '-300.00'.
            booking-currency        = 'INR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B006'.
            booking-passenger_name  = 'PASSENGER 6'.
            booking-carrier_id      = 'LH'.
            booking-connection_id   = '0400'.
            booking-flight_date     = '20261110'.
            booking-passenger_count = 1.
            booking-fare            = '380.00'.
            booking-currency        = 'EUR'.
            booking-status          = 'X'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B007'.
            booking-passenger_name  = 'PASSENGER 7'.
            booking-carrier_id      = ''.
            booking-connection_id   = '0300'.
            booking-flight_date     = '20261120'.
            booking-passenger_count = 1.
            booking-fare            = '700.00'.
            booking-currency        = 'INR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B008'.
            booking-passenger_name  = 'PASSENGER 8'.
            booking-carrier_id      = 'AI'.
            booking-connection_id   = '0101'.
            booking-flight_date     = '20261112'.
            booking-passenger_count = 2.
            booking-fare            = '4800.00'.
            booking-currency        = 'INR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B009'.
            booking-passenger_name  = 'PASSENGER 9'.
            booking-carrier_id      = 'LH'.
            booking-connection_id   = '0402'.
            booking-flight_date     = '20261115'.
            booking-passenger_count = 1.
            booking-fare            = '650.00'.
            booking-currency        = 'GBP'.
            booking-status          = 'C'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B010'.
            booking-passenger_name  = 'PASSENGER 10'.
            booking-carrier_id      = 'AI'.
            booking-connection_id   = '0102'.
            booking-flight_date     = '20261118'.
            booking-passenger_count = 2.
            booking-fare            = '5000.00'.
            booking-currency        = 'INR'.
            booking-status          = 'Z'.

            APPEND booking TO bookings.


            CLEAR booking.

            booking-booking_id      = 'B011'.
            booking-passenger_name  = 'PASSENGER 11'.
            booking-carrier_id      = 'LH'.
            booking-connection_id   = '0400'.
            booking-flight_date     = '20261110'.
            booking-passenger_count = 1.
            booking-fare            = '520.00'.
            booking-currency        = 'EUR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.

            CLEAR booking.

            booking-booking_id      = 'B003'.
            booking-passenger_name  = 'PASSENGER 12'.
            booking-carrier_id      = 'AI'.
            booking-connection_id   = '0101'.
            booking-flight_date     = '20261112'.
            booking-passenger_count = 2.
            booking-fare            = '5200.00'.
            booking-currency        = 'INR'.
            booking-status          = 'C'.

            APPEND booking TO bookings.



 LOOP AT bookings INTO booking.

  CLEAR validation_result.

  READ TABLE processed_booking_ids
    WITH KEY table_line = booking-booking_id
    TRANSPORTING NO FIELDS.

          IF sy-subrc = 0.

            validation_result-booking_id       = booking-booking_id.
            validation_result-passenger_name   = booking-passenger_name.
            validation_result-carrier_id       = booking-carrier_id.
            validation_result-passenger_count  = booking-passenger_count.
            validation_result-fare             = booking-fare.
            validation_result-currency         = booking-currency.
            validation_result-status           = booking-status.

            validation_result-result           = 'R'.
            validation_result-rejection_reason = 'DUPLICATE_BOOKING_ID'.

            APPEND validation_result TO validation_results.

    CONTINUE.

  ENDIF.

              IF booking-carrier_id IS INITIAL.

              validation_result-booking_id       = booking-booking_id.
              validation_result-passenger_name   = booking-passenger_name.
              validation_result-carrier_id       = booking-carrier_id.
              validation_result-passenger_count  = booking-passenger_count.
              validation_result-fare             = booking-fare.
              validation_result-currency         = booking-currency.
              validation_result-status           = booking-status.

              validation_result-result           = 'R'.
              validation_result-rejection_reason = 'MISSING_CARRIER'.

              APPEND validation_result TO validation_results.

  CONTINUE.

ENDIF.

            IF booking-connection_id IS INITIAL.

              validation_result-booking_id       = booking-booking_id.
              validation_result-passenger_name   = booking-passenger_name.
              validation_result-carrier_id       = booking-carrier_id.
              validation_result-passenger_count  = booking-passenger_count.
              validation_result-fare             = booking-fare.
              validation_result-currency         = booking-currency.
              validation_result-status           = booking-status.

              validation_result-result           = 'R'.
              validation_result-rejection_reason = 'MISSING_CONNECTION'.

              APPEND validation_result TO validation_results.

  CONTINUE.

ENDIF.

            IF booking-flight_date IS INITIAL.

              validation_result-booking_id       = booking-booking_id.
              validation_result-passenger_name   = booking-passenger_name.
              validation_result-carrier_id       = booking-carrier_id.
              validation_result-passenger_count  = booking-passenger_count.
              validation_result-fare             = booking-fare.
              validation_result-currency         = booking-currency.
              validation_result-status           = booking-status.

              validation_result-result           = 'R'.
              validation_result-rejection_reason = 'MISSING_FLIGHT_DATE'.

              APPEND validation_result TO validation_results.

  CONTINUE.

ENDIF.

            IF booking-passenger_count <= 0.

              validation_result-booking_id       = booking-booking_id.
              validation_result-passenger_name   = booking-passenger_name.
              validation_result-carrier_id       = booking-carrier_id.
              validation_result-passenger_count  = booking-passenger_count.
              validation_result-fare             = booking-fare.
              validation_result-currency         = booking-currency.
              validation_result-status           = booking-status.

              validation_result-result           = 'R'.
              validation_result-rejection_reason = 'INVALID_PASSENGER_COUNT'.

              APPEND validation_result TO validation_results.

  CONTINUE.

ENDIF.

            IF booking-fare <= 0.

              validation_result-booking_id       = booking-booking_id.
              validation_result-passenger_name   = booking-passenger_name.
              validation_result-carrier_id       = booking-carrier_id.
              validation_result-passenger_count  = booking-passenger_count.
              validation_result-fare             = booking-fare.
              validation_result-currency         = booking-currency.
              validation_result-status           = booking-status.

              validation_result-result           = 'R'.
              validation_result-rejection_reason = 'INVALID_FARE'.

              APPEND validation_result TO validation_results.

  CONTINUE.

ENDIF.

            IF booking-currency IS INITIAL.

              validation_result-booking_id       = booking-booking_id.
              validation_result-passenger_name   = booking-passenger_name.
              validation_result-carrier_id       = booking-carrier_id.
              validation_result-passenger_count  = booking-passenger_count.
              validation_result-fare             = booking-fare.
              validation_result-currency         = booking-currency.
              validation_result-status           = booking-status.

              validation_result-result           = 'R'.
              validation_result-rejection_reason = 'MISSING_CURRENCY'.

              APPEND validation_result TO validation_results.

  CONTINUE.

ENDIF.

            IF booking-status <> 'C'
               AND booking-status <> 'X'.

              validation_result-booking_id       = booking-booking_id.
              validation_result-passenger_name   = booking-passenger_name.
              validation_result-carrier_id       = booking-carrier_id.
              validation_result-passenger_count  = booking-passenger_count.
              validation_result-fare             = booking-fare.
              validation_result-currency         = booking-currency.
              validation_result-status           = booking-status.

              validation_result-result           = 'R'.
              validation_result-rejection_reason = 'INVALID_STATUS'.

              APPEND validation_result TO validation_results.

  CONTINUE.

ENDIF.

            validation_result-booking_id      = booking-booking_id.
            validation_result-passenger_name  = booking-passenger_name.
            validation_result-carrier_id      = booking-carrier_id.
            validation_result-passenger_count = booking-passenger_count.
            validation_result-fare            = booking-fare.
            validation_result-currency        = booking-currency.
            validation_result-status          = booking-status.

            validation_result-result = 'V'.

            IF booking-status = 'C'.

              validation_result-revenue_eligibility = 'X'.
              validation_result-revenue =
                booking-passenger_count * booking-fare.

ELSEIF booking-status = 'X'.

              CLEAR validation_result-revenue_eligibility.
              CLEAR validation_result-revenue.

ENDIF.

        APPEND validation_result TO validation_results.

  processed_booking_id = booking-booking_id.

  APPEND processed_booking_id TO processed_booking_ids.

ENDLOOP.

total_bookings = lines( bookings ).

LOOP AT validation_results INTO validation_result.

  IF validation_result-result = 'V'.

    valid_bookings = valid_bookings + 1.

    IF validation_result-status = 'X'.
      cancelled_bookings = cancelled_bookings + 1.
    ENDIF.

    IF validation_result-revenue_eligibility = 'X'.
      revenue_eligible_bookings =
        revenue_eligible_bookings + 1.
    ENDIF.

  ELSEIF validation_result-result = 'R'.

    rejected_bookings = rejected_bookings + 1.

  ENDIF.

ENDLOOP.

LOOP AT validation_results INTO validation_result
  WHERE result = 'V'
    AND revenue_eligibility = 'X'.

  READ TABLE revenue_summary
    INTO revenue_line
    WITH KEY carrier_id = validation_result-carrier_id
             currency   = validation_result-currency.

  IF sy-subrc = 0.

    revenue_line-passenger_count =
      revenue_line-passenger_count
      + validation_result-passenger_count.

    revenue_line-revenue =
      revenue_line-revenue
      + validation_result-revenue.

    MODIFY revenue_summary FROM revenue_line
      INDEX sy-tabix.

  ELSE.

    CLEAR revenue_line.

    revenue_line-carrier_id =
      validation_result-carrier_id.

    revenue_line-currency =
      validation_result-currency.

    revenue_line-passenger_count =
      validation_result-passenger_count.

    revenue_line-revenue =
      validation_result-revenue.

    APPEND revenue_line TO revenue_summary.

  ENDIF.

ENDLOOP.

            out->write( '=============================================' ).
            out->write( '       FLIGHT BOOKING BUSINESS REPORT' ).
            out->write( '=============================================' ).

            out->write( ' ' ).
            out->write( 'INPUT / VALIDATION SUMMARY' ).

            out->write( |Total Bookings       : { lines( bookings ) }| ).
            out->write( |Valid Bookings       : { valid_bookings }| ).
            out->write( |Rejected Bookings    : { rejected_bookings }| ).
            out->write( |Cancelled Bookings   : { cancelled_bookings }| ).
            out->write( |Revenue Eligible     : { revenue_eligible_bookings }| ).


            out->write( ' ' ).
            out->write( '---------------------------------------------' ).
            out->write( 'REJECTION / EXCEPTION REPORT' ).
            out->write( '---------------------------------------------' ).

            LOOP AT validation_results INTO validation_result
              WHERE result = 'R'.

              out->write(
                |Booking: { validation_result-booking_id } |
                && |Passenger: { validation_result-passenger_name } |
                && |Reason: { validation_result-rejection_reason }|
              ).

ENDLOOP.

            out->write( ' ' ).
            out->write( '---------------------------------------------' ).
            out->write( 'REVENUE SUMMARY' ).
            out->write( '---------------------------------------------' ).

            LOOP AT revenue_summary INTO revenue_line.

              out->write(
                |Carrier: { revenue_line-carrier_id } |
                && |Currency: { revenue_line-currency } |
                && |Passengers: { revenue_line-passenger_count } |
                && |Revenue: { revenue_line-revenue }|
              ).

ENDLOOP.

  ENDMETHOD.
ENDCLASS.
