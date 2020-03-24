`include "Filter.sv"
`include "PulseGenerator.sv"
`include "DataCounter.sv"

module DataGenerator (Clock, Button_Up, Button_Reset, Button_Down, Button_Sign, Data, SigneBit);
  parameter Size = 5,
            Signed = "No",
            ClockPeriod_ns = 20,
            FilterPeriod_ns = 1_000_000,
            PauseInterval_ns = 450_000_000,
            RepeatsInterval_ns = 150_000_000;
  input var bit Clock;
  input var logic Button_Up, Button_Reset, Button_Down, Button_Sign;
  output var logic [Size-1: 0] Data;
  output var logic SigneBit;
  
  Filter
       #(.Size(4),
         . ClockPeriod_ns(ClockPeriod_ns),
         . FilterPeriod_ns(FilterPeriod_ns))
     F1 (. Clock,
         .I({Button_Up,Button_Reset,Button_Down,Button_Sign}),
         .O({FilteredUp,FilteredReset,FilteredDown,FilterSign}));
		 
  PulseGenerator
       #(. ClockPeriod_ns(ClockPeriod_ns),
         . PauseInterval_ns(PauseInterval_ns),
         . RepeatsInterval_ns(RepeatsInterval_ns))
    PG1 (. Clock,
         . iUp(FilteredUp),
         . iDown(FilteredDown),
			. iSign(FilterSign),
         . oUp(Up),
         . oDown(Down),
			. oSign(Sign));
		 
  DataCounter
       #(.Size(Size), .Signed(Signed))
  DCnt1 (. Clock,
         . Up,
         . Reset(FilteredReset),
         . Down,
         . Sign,
         . Data,
         . SigneBit);
endmodule: DataGenerator