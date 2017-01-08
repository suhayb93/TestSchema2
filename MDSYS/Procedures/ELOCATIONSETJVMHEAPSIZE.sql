CREATE OR REPLACE NONEDITIONABLE PROCEDURE mdsys.ElocationSetJVMHeapSize(sz NUMBER)
 AS LANGUAGE JAVA NAME
  'oracle.aurora.vm.OracleRuntime.setMaxMemorySize(long)';
/