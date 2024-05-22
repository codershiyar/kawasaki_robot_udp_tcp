.PROGRAM connect_to_pc()
  ; Configuration for connection
  timeout_open = 60
  pc_ip[1] = 192
  pc_ip[2] = 168
  pc_ip[3] = 0
  pc_ip[4] = 2  ; PC's IP address
  pc_port = 10001
  error_count = 0

connect:
  ; Start timer
  TIMER (2) = 0
  
  ; Attempt to connect to the PC
  TCP_CONNECT socket_id, pc_port, pc_ip[1], timeout_open
  
  ; Check if connection is successful
  IF socket_id < 0 THEN
    error_count = error_count + 1
    IF error_count >= 5 THEN
      PRINT "Client Communication with PC has failed"
    ELSE
      PRINT "TCP_CONNECT error id = ", socket_id, ", error count = ", error_count
      GOTO connect
    END
  ELSE
    PRINT "TCP_CONNECT OK id = ", socket_id, ", with time elapsed = ", TIMER (2)
  END
  
.END

.PROGRAM receive_data()
  ; Loop to receive data continuously
  WHILE TRUE DO
    num_bytes = 10
    max_length = 10
    timeout_receive = 60
    recv_result = 0
    
    ; Receive data from the PC
    TCP_RECV recv_result, socket_id, $receive_buffer[1], num_bytes, timeout_receive, max_length
    
    ; Check if data reception is successful
    IF recv_result < 0 THEN
      PRINT "TCP_RECV error in RECV", recv_result
      $receive_buffer[1] = "000"
    ELSE
      IF num_bytes > 0 THEN
        ; Print received data
        FOR i = 1 TO num_bytes
          PRINT "RecBuff[", i, "] = ", $receive_buffer[i]
          
          ; Check for specific messages
          IF $receive_buffer[1] == "1" THEN
            PRINT "IT IS 1"
          END
          IF $receive_buffer[1] == "2" THEN
            PRINT "IT IS 2"
          END
        END
      ELSE
        $receive_buffer[1] = "000"
        recv_result = -1
      END
    END
  END
 
.END

.PROGRAM close_connection()
  ; Close the connection to the PC
  close_result = 0
  IF socket_id >= 0 THEN
    TCP_CLOSE close_result, socket_id
  END
  
  ; Check if the connection is closed successfully
  IF close_result < 0 THEN
    PRINT "TCP_CLOSE error id = ", socket_id
  ELSE
    PRINT "TCP_CLOSE OK id = ", socket_id
  END
.END
