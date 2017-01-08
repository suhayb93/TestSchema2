CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.SDO_WS_PROCESS AUTHID current_user AS
        function evaluateExpr(operandType varchar2, op varchar2, operand1 varchar2, operand2 varchar2) return number;
        function evaluateNonTSExpr(op IN VARCHAR2, p1 IN VARCHAR2, p2 IN VARCHAR2) RETURN NUMBER ;
        function evaluateNonTSNumExpr(op IN VARCHAR2, p1 IN NUMBER, p2 IN NUMBER) RETURN NUMBER ;
        function evaluateTimeExpr(op varchar2, operand1 varchar2, operand2 varchar2) return number;
        function evaluateTSExpr(op varchar2, l_operand1 varchar2, l_operand2 varchar2) return number ;
        function evaluateGYearMonthExpr(op varchar2, operand1 varchar2, operand2 varchar2) return number ;
        function evaluateGMonthDayExpr(op varchar2, operand1 varchar2, operand2 varchar2) return number ;
        function evaluateGYearExpr(op varchar2, operand1 varchar2, operand2 varchar2) return number ;
        function evaluateGMonthExpr(op varchar2, operand1 varchar2, operand2 varchar2) return number ;
        function evaluateGDayExpr(op varchar2, operand1 varchar2, operand2 varchar2) return number ;
        function evaluateDurationExpr(op varchar2, operand1 varchar2, operand2 varchar2) return number ;
        function convertDurationExpr(operand varchar2) return number ;
        function checkLength(val varchar2, maxLength number) return number;

end;
/