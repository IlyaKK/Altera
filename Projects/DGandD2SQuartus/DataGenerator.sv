`include "Filter.sv"
`include "PulseGenerator.sv"
`include "DataCounter.sv"

module DataGenerator (Clock, Button_Up, Button_Reset, Button_Down, Button_Signed, Data);
  parameter Size = 5,
            Signed = "Yes",
            ClockPeriod_ns = 20,
            FilterPeriod_ns = 1_000_000,
            PauseInterval_ns = 400_000_000,
            RepeatsInterval_ns = 150_000_000;
  input var bit Clock;
  input var logic Button_Up, Button_Reset, Button_Down, Button_Signed;
  output var logic [Size-1: 0] Data;
  
  Filter
       #(.Size(3),
         . ClockPeriod_ns(ClockPeriod_ns),
         . FilterPeriod_ns(FilterPeriod_ns))
     F1 (. Clock,
         .I({Button_Up,Button_Reset,Button_Down}),
         .O({FilteredUp,FilteredReset,FilteredDown}));
		 
  PulseGenerator
       #(. ClockPeriod_ns(ClockPeriod_ns),
         . PauseInterval_ns(PauseInterval_ns),
         . RepeatsInterval_ns(RepeatsInterval_ns))
    PG1 (. Clock,
         . iUp(FilteredUp),
         . iDown(FilteredDown),
         . oUp(Up),
         . oDown(Down));
		 
  DataCounter
       #(.Size(Size), .Signed(Signed))
  DCnt1 (. Clock,
         . Up,
         .Reset(FilteredReset),
         . Down,
         . Data);
endmodule: DataGenerator