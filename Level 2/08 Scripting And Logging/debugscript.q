out:{-1 string[.z.p]," ### INFO ### ",x};
err:{-2 string[.z.p]," ### ERROR ### ",x};

randomList : {[n;lowlimit;upplimit]
  if[-7h <> type n; err "ERROR : First Argument should be a long integer"];
  if[(-7h <> type lowlimit) or ((-7h <> type upplimit)); err "ERROR : Lower and Upper limits should be long integers"];
  $[upplimit > lowlimit;
   n?lowlimit+til 1+upplimit-lowlimit;
   err "Upper limit should be greater than lower limit"]
};

getCorrelation : {
  a:randomList[10;15;5];
  b:randomList[9;15;20];
  .[cor;(a;b);{err "Error running main: ",x;exit 1}];
  out "the correlation is = ", string cor[a;b]
 };


getCorrelation[]
getCorrelation[]
getCorrelation[]
exit 0;