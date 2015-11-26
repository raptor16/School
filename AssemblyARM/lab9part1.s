_start:     LDR      r1,[test_num,LSL #4] // r1 = a[j]
            LDR      r2,[test_num,LSL #8]        // r2 = a[j+1]
            LDR      r8, test_num
            CMP      r1,r2             // arr[j] <= arr[j+1]
            BLE      BUBBLE          //jump if yes
BUBBLE:     ADD      r0,r0,#1         // j++
            CMP      r0,[r8]           // j < value of r8
            BLT      SWAP           // jump to inner loop if yes
INNER:      LDR r9, #r1
            LDR r1, #r2
            LDR r2, #r9
            ADD      r12,r12,#1      // i++
            CMP      r12,#5          // i < 5
            BLT      BUBBLE         // jump to outer loop if yes
test_num:   
            .end