out:{-1 string[.z.p]," ### INFO ### ",x};
err:{-2 string[.z.p]," ### ERROR ### ",x};

sayhello:{out["Hello ",x]};
sayhello["Nicolas"];

d:.Q.opt .z.x;
if[0=count d; out["No parameter provided"]];

0N!"hello ",first d[`name];
exit 0;