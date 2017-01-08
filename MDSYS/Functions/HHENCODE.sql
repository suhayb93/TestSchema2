CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhencode (
           v01 IN NUMBER,         l01 IN NUMBER,
           u01 IN NUMBER,         p01 IN BINARY_INTEGER,
           v02 IN NUMBER := NULL, l02 IN NUMBER := NULL,
           u02 IN NUMBER := NULL, p02 IN BINARY_INTEGER := NULL,
           v03 IN NUMBER := NULL, l03 IN NUMBER := NULL,
           u03 IN NUMBER := NULL, p03 IN BINARY_INTEGER := NULL,
           v04 IN NUMBER := NULL, l04 IN NUMBER := NULL,
           u04 IN NUMBER := NULL, p04 IN BINARY_INTEGER := NULL,
           v05 IN NUMBER := NULL, l05 IN NUMBER := NULL,
           u05 IN NUMBER := NULL, p05 IN BINARY_INTEGER := NULL,
           v06 IN NUMBER := NULL, l06 IN NUMBER := NULL,
           u06 IN NUMBER := NULL, p06 IN BINARY_INTEGER := NULL,
           v07 IN NUMBER := NULL, l07 IN NUMBER := NULL,
           u07 IN NUMBER := NULL, p07 IN BINARY_INTEGER := NULL,
           v08 IN NUMBER := NULL, l08 IN NUMBER := NULL,
           u08 IN NUMBER := NULL, p08 IN BINARY_INTEGER := NULL,
           v09 IN NUMBER := NULL, l09 IN NUMBER := NULL,
           u09 IN NUMBER := NULL, p09 IN BINARY_INTEGER := NULL,
           v10 IN NUMBER := NULL, l10 IN NUMBER := NULL,
           u10 IN NUMBER := NULL, p10 IN BINARY_INTEGER := NULL,
           v11 IN NUMBER := NULL, l11 IN NUMBER := NULL,
           u11 IN NUMBER := NULL, p11 IN BINARY_INTEGER := NULL,
           v12 IN NUMBER := NULL, l12 IN NUMBER := NULL,
           u12 IN NUMBER := NULL, p12 IN BINARY_INTEGER := NULL,
           v13 IN NUMBER := NULL, l13 IN NUMBER := NULL,
           u13 IN NUMBER := NULL, p13 IN BINARY_INTEGER := NULL,
           v14 IN NUMBER := NULL, l14 IN NUMBER := NULL,
           u14 IN NUMBER := NULL, p14 IN BINARY_INTEGER := NULL,
           v15 IN NUMBER := NULL, l15 IN NUMBER := NULL,
           u15 IN NUMBER := NULL, p15 IN BINARY_INTEGER := NULL,
           v16 IN NUMBER := NULL, l16 IN NUMBER := NULL,
           u16 IN NUMBER := NULL, p16 IN BINARY_INTEGER := NULL,
           v17 IN NUMBER := NULL, l17 IN NUMBER := NULL,
           u17 IN NUMBER := NULL, p17 IN BINARY_INTEGER := NULL,
           v18 IN NUMBER := NULL, l18 IN NUMBER := NULL,
           u18 IN NUMBER := NULL, p18 IN BINARY_INTEGER := NULL,
           v19 IN NUMBER := NULL, l19 IN NUMBER := NULL,
           u19 IN NUMBER := NULL, p19 IN BINARY_INTEGER := NULL,
           v20 IN NUMBER := NULL, l20 IN NUMBER := NULL,
           u20 IN NUMBER := NULL, p20 IN BINARY_INTEGER := NULL,
           v21 IN NUMBER := NULL, l21 IN NUMBER := NULL,
           u21 IN NUMBER := NULL, p21 IN BINARY_INTEGER := NULL,
           v22 IN NUMBER := NULL, l22 IN NUMBER := NULL,
           u22 IN NUMBER := NULL, p22 IN BINARY_INTEGER := NULL,
           v23 IN NUMBER := NULL, l23 IN NUMBER := NULL,
           u23 IN NUMBER := NULL, p23 IN BINARY_INTEGER := NULL,
           v24 IN NUMBER := NULL, l24 IN NUMBER := NULL,
           u24 IN NUMBER := NULL, p24 IN BINARY_INTEGER := NULL,
           v25 IN NUMBER := NULL, l25 IN NUMBER := NULL,
           u25 IN NUMBER := NULL, p25 IN BINARY_INTEGER := NULL,
           v26 IN NUMBER := NULL, l26 IN NUMBER := NULL,
           u26 IN NUMBER := NULL, p26 IN BINARY_INTEGER := NULL,
           v27 IN NUMBER := NULL, l27 IN NUMBER := NULL,
           u27 IN NUMBER := NULL, p27 IN BINARY_INTEGER := NULL,
           v28 IN NUMBER := NULL, l28 IN NUMBER := NULL,
           u28 IN NUMBER := NULL, p28 IN BINARY_INTEGER := NULL,
           v29 IN NUMBER := NULL, l29 IN NUMBER := NULL,
           u29 IN NUMBER := NULL, p29 IN BINARY_INTEGER := NULL,
           v30 IN NUMBER := NULL, l30 IN NUMBER := NULL,
           u30 IN NUMBER := NULL, p30 IN BINARY_INTEGER := NULL,
           v31 IN NUMBER := NULL, l31 IN NUMBER := NULL,
           u31 IN NUMBER := NULL, p31 IN BINARY_INTEGER := NULL,
           v32 IN NUMBER := NULL, l32 IN NUMBER := NULL,
           u32 IN NUMBER := NULL, p32 IN BINARY_INTEGER := NULL)
    RETURN RAW IS
begin
 return  md.hhencode(v01,l01,u01,p01, v02,l02,u02,p02, v03,l03,u03,p03,
 v04,l04,u04,p04, v05,l05,u05,p05, v06,l06,u06,p06,
 v07,l07,u07,p07, v08,l08,u08,p08, v09,l09,u09,p09,
 v10,l10,u10,p10,
 v11,l11,u11,p11, v12,l12,u12,p12, v13,l13,u13,p13,
 v14,l14,u14,p14, v15,l15,u15,p15, v16,l16,u16,p16,
 v17,l17,u17,p17, v18,l18,u18,p18, v19,l19,u19,p19,
 v20,l20,u20,p20,
 v21,l21,u21,p21, v22,l22,u22,p22, v23,l23,u23,p23,
 v24,l24,u24,p24, v25,l25,u25,p25, v26,l26,u26,p26,
 v27,l27,u27,p27, v28,l28,u28,p28, v29,l29,u29,p29,
 v30,l30,u30,p30,
 v31,l31,u31,p31, v32,l32,u32,p32);
end;
/