out:{-1 string[.z.p]," ### INFO ### ",x};
err:{-2 string[.z.p]," ### ERROR ### ",x};

printList : {0N!til x};

d:.Q.opt .z.x;
0N!d;

a:"J"$first first d[`num1];
b:"J"$first first d[`num2];

if[0=count d; err["No parameter provided"]];

0N!a;
0N!b;

@[printList;a;{err "Error running main: ",x;exit 1}];
@[printList;b;{err "Error running main: ",x;exit 1}];

exit 0;