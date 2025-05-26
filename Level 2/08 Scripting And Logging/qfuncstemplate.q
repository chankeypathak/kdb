randomList : {[n;lowlimit;upplimit]
  if[; 0N!"ERROR : First Argument should be a long integer"]; //Fill the condition for the if statement. We need to check the type of the parameter n
  if[; 0N!"ERROR : Lower and Upper limits should be long integers"]; // //Fill the condition for the if statement. We need to check the type of the limit parameters
  $[upplimit > lowlimit;
   n?lowlimit+til 1+upplimit-lowlimit;
   0N!"Upper limit should be greater than lower limit"]
 };