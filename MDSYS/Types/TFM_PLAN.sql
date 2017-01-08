CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.TFM_PLAN
AS OBJECT (
  THE_PLAN SDO_TFM_CHAIN,

  CONSTRUCTOR FUNCTION TFM_PLAN
      RETURN SELF AS RESULT,

  CONSTRUCTOR FUNCTION TFM_PLAN(
    source_srid NUMBER)
      RETURN SELF AS RESULT,

  MEMBER PROCEDURE ADD_STEP(
    srid_source  NUMBER,
    tfm         NUMBER,
    srid_target  NUMBER),

  MEMBER FUNCTION GET_NUM_STEPS
      RETURN NUMBER,

  MEMBER FUNCTION GET_STEP(
    num           IN NUMBER,
    source_srid   OUT NUMBER,
    target_srid   OUT NUMBER) RETURN NUMBER,

  MEMBER FUNCTION expand_concat_chain_element(
    source_srid   IN NUMBER,
    chain_element IN NUMBER,
    target_srid   IN NUMBER)
      RETURN TFM_PLAN,

  MEMBER PROCEDURE expand_for_chain_element_core(
    srid_source  IN NUMBER,
    chain_element IN NUMBER,
    srid_target  IN NUMBER),

  MEMBER PROCEDURE expand_inv_chain_element_core(
    srid_source  IN NUMBER,
    chain_element IN NUMBER,
    srid_target  IN NUMBER),

  MEMBER PROCEDURE expand_chain_element_core(
    srid_source  IN NUMBER,
    chain_element IN NUMBER,
    srid_target  IN NUMBER),

  MEMBER FUNCTION expand_concat_chain_elements
      RETURN TFM_PLAN
);
/
CREATE OR REPLACE TYPE BODY mdsys.TFM_PLAN wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
1519 625
hlg4dSLyIGiAoqcwJQaZMoJp57Mwg81UmiAF3y8Zx/kYhKkVCfb2x5J3vrLKDMNmZ9NE8ScT
SWsKDT3dizb0LYFrquRKZj738Yp7alBv6UQEYYWGCJi7MCQRUl7TVOvOOaLxsQFvb8ibA4Kp
429xS8XTiTUJlPda3rP6jzTPBPOU1am3VjfIhtVkZaixHdj6XOXb2yrMI6oQRHroDXfzTAfe
7jrVgMrKIEQ+Bu5LxNJDJVGXZSprn42dzKM/EMs7sdGGoODzJq0MC8OnZL1OnayIbxih9qXa
SdN2iV9gFOIEN3xK9tFaJs3dYw0JjM11CvDxdkcL0MSbZpHqogSYjXmF7BxUrafo9Opp+0HD
dW+PYqfHVHGPwb67+CUchj9zAjT3Wg6Z5eYwrrIm3qgWopJsOCEkgo+bdZqlZ8AEvMvrVnEX
GuhsW+QRWHixRvfcHMbW4wlvjMPw/xJsLunoXYz+8jTnB6pSUA1qJUCcjPSEdYBTgLSuaiRh
OINKAmXbg8+DyD+xehtfRFZZrSZOU9Qfl3qAy3CnxgM6uHTuSjkf2cHZH5ZgUdLivqrEmhm5
cDlPImu182OWqtdwxwV63bmfKNfGzWoidSmC4hzxUpvNNRnF3f7XmtdzajPEJBOo/GZgg/j3
N5Swg3xhcOG1jpKon0LgJMYNbTE/gp0uyr8xsNnck4UCWaZ55jL/MaiTWA2Sbk5TEIeHg/aQ
zdw4PAEy3X3I15NTMSH9MLR4vxjy2l7y8pakrJYSiJCkPUIx7Z1zHsukrIBE+TG5JN34KLth
2lOYID+aP0bJxDG5+Wc+zTsdnwxckNl2wkABBuBUSXYuS6ZceINZUhiciWK2gRrVbVdMCxkg
DJ6/DA7FW2olsEm3dLfqnXkT2u4XaTl2BdhkTE2a8qBIWMKXglDyUw07KichKSxgZPzuw0ID
ePHbqyKWQfL18bs9S0FK21/jRPbY/JOw8obrInqilEK6QOlxC9W2AuaBbyqnJm5w9KteIWZQ
k3xu9eegp8sEoBJnKmhh5skwKldvzRp7bpe4mTgXRY6eX3nfYKCJ87YePPK2s0pLiKB0Uvpc
/d4/0FKtVQspRN4Ikspa2pB6ShDa+rRdvxBUlVff4npi4kucyPJTWGU78pxDl2dts/FLaRxu
RbBHWDxUAQpSSLMSImLY9I0Vb8bBxv1T4pA+hFLXa26KmpdnmK9gVpgsB4JiSpJQlh799g0r
mujzAHa2HD67um6t5AA40vDdmPDx8nzqlSrv84cyEWBASb5P1GpuRrT7dQFKXhrBdiw45iHj
dpQwtqjoe5jX+KbAcMx5lN+6Bk3EpK/MivpnyC/qn7qa+zIYCDaX+aBy11R4rYjs/60siSJJ
xbDWihFxUUk/20MfGNm1L6ea6VbciQ433SZrV9EJmicW3MY9s2nkJTh95H/u/L52aInQSZkH
YJxhPkWSEo8IGY/3J7A0uGgdsCHj5LXNhtgkO+Qi5PKXY7+nNXwylKXkM2VwWwYm1yy0O4K5
wlSSTh1eW0lBMmlVVBJ+EoXqF8I1tSkPQbb4uQ==
/