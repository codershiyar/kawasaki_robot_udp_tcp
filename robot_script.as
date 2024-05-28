.PROGRAM receive_messages_via_UDP()
; Kawasaki Robot AS Language Script to receive messages via UDP
; This script is created by Coder Shiyar
; Configuration 
timeout = 9
ip[1] = 192
ip[2] = 168
ip[3] = 0
ip[4] = 2  ; PC's IP address
port = 10010
numbytes = 1
ret = 0

; Main loop to receive UDP messages
WHILE TRUE DO
  TWAIT 3
  UDP_RECVFROM ret, port, $received_message[0], numbytes, timeout, ip[1]
  IF ret <> 0 THEN
    PRINT "Error with the UDP Reception, code: ", ret
    HALT
  END

  PRINT "Message: ", $received_message[0]
 ; Send confirmation message
      $cnt[0] = $ENCODE (/D, numbytes)
      UDP_SENDTO ret, ip[1], port, $cnt[0], 1, 9
      IF ret <> 0 THEN
        PRINT "Error with the UDP send, code: ", ret
        ; Optionally handle send error but do not halt
      END
END
.END
