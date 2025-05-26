out:{-1 string[.z.p]," ### INFO ### ",x};
err:{-2 string[.z.p]," ### ERROR ### ",x};

printProduct : {out["The product is = ",string x*y]};

d:.Q.opt .z.x;

0N!d;

a:"J"$first first d[`num1];
b:"J"$first first d[`num2];

if[0=count d; err["No parameter provided"]];

$[(0N="J"$first first d[`num1]) or (0N="J"$first first d[`num2]); err["Type Mismatch : Please provide a long integer value"]; printProduct[a;b]] ;


exit 0;