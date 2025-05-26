volprof:{
 p:1.75;
 c:floor x%3;
 b:(c?1.0) xexp p;
 e:2-(c?1.0) xexp p;
 m:(x-2*c)?1.0;
 {(neg count x)?x} m,0.5*b,e}
namegenerator : {[sy;dt;ot;sp](((string sy),"" sv "." vs string dt),string ot),string sp};
exchmsg : {[on;br;ex] $[ex=3; "-" sv ("CME";on;string br); "-" sv ("ISE";string br;on)]};

trade:([]trade_id:1+til 500;time:(asc 09:30:00.0+floor 23400000*volprof 500);option_id:500?1+til 100; price:500?100.0; qty:500?1+til 100; side:500?`B`S);
update edge : (500?(1+til 10),neg(1+til 5))*price*0.005*qty from `trade;
trade : trade ^ ([]exch_id:500?3 4;broker_id:500?700+til 10);
0N!"Trade Table Created";
spread : ([]spread_id:1001 1001 1002 1002 1003 1003 1004 1004 1005 1005; option_id:82 88 74 98 86 88 80 90 72 100; qty:10#(100 -100));
0N!"Spread table created";
inst:([]inst_id:1+til 10; inst_syb : `AAPL`MSFT`NFLX`GOOGL`IBM`MCD`KO`TSLA`FB`RACE; inst_name:("Apple";"Microsoft";"Netflix";"Alphabet";"IBM";"Mc Donald's";"Coca-Cola";"Tesla";"Facebook";"Ferrari") );
option:([]option_id:1+til 100; inst_id:(30#7),(40#8),(30#9); opt_type:100#`P`C);
update strike:30#(40 40 45 45 50 50 55 55 60 60), expiry:((10#enlist "07/20/2020"),(10#enlist "09/20/2020"),(10#enlist"11/20/2020")) from `option where inst_id = 7;
update strike:40#(1400 1400 1500 1500 1600 1600 1700 1700 1800 1800), expiry:((10#enlist "07/20/2020"),(10#enlist "09/20/2020"),(10#enlist"11/20/2020"),(10#enlist"01/20/2021")) from `option where inst_id = 8;
update strike:30#(230 230 240 240 250 250 260 260 270 270), expiry:((10#enlist "07/20/2020"),(10#enlist "09/20/2020"),(10#enlist"11/20/2020")) from `option where inst_id = 9;
t1 : (update "D"$expiry from option) lj `inst_id xkey inst;
t2 : update optionname : namegenerator ' [inst_syb;expiry;opt_type;strike] from t1;
message : select trade_id, exch_message from update exch_message:exchmsg ' [optionname;broker_id;exch_id] from trade lj select last optionname by option_id from t2;
0N!"Message table created";
// nbbo: date time sym bid ask bsize asize
vol:{10+`int$x?90};
rnd:{0.01*floor 0.5+x*100};
qp:(10000?1+ til 100);
t:(asc 09:30:00.0+floor 23400000*volprof 10000);
nbbo:([]option_id:10000?1+til 100;time:t;bid:qp-((rnd 10000?1.0) & -0.02 + rnd 10000?1.0);ask:qp+((rnd 10000?1.0) & -0.02 + rnd 10000?1.0);bsize:vol[10000];asize:vol[10000]);
0N!"Nbbo table created";
.Q.dpft[`:db;2020.08.03;`option_id;`trade];
.Q.dpft[`:db;2020.08.03;`spread_id;`spread];
.Q.dpft[`:db;2020.08.03;`option_id;`nbbo];

.Q.dpft[`:db;2020.08.04;`option_id;`trade];
.Q.dpft[`:db;2020.08.04;`spread_id;`spread];
.Q.dpft[`:db;2020.08.04;`option_id;`nbbo];

trade:([]trade_id:1+til 500;time:(asc 09:30:00.0+floor 23400000*volprof 500);option_id:500?1+til 100; price:500?100.0; qty:500?1+til 100; side:500?`B`S);
update edge : (500?(1+til 10),neg(1+til 5))*price*0.005*qty from `trade;
trade : trade ^ ([]exch_id:500?3 4;broker_id:500?700+til 10);

.Q.dpft[`:db;2020.08.05;`option_id;`trade];
.Q.dpft[`:db;2020.08.05;`spread_id;`spread];
.Q.dpft[`:db;2020.08.05;`option_id;`nbbo];
.Q.dpft[`:db;2020.08.06;`option_id;`trade];
.Q.dpft[`:db;2020.08.06;`spread_id;`spread];
.Q.dpft[`:db;2020.08.06;`option_id;`nbbo];
0N!"Saved Tables to partitioned db";
save `message.csv;
0N!"Saved exch message as csv";
0N!"Creating reference data service on port 5010";
system["nohup env QHOME=/opt/kx/q q new_funds/TRAINING_modules/FinalProjectDraft/referenceDataCreation.q -p 5010 >/dev/null 2>&1 &"];
0N!"CREATED reference data service on port 5010";
