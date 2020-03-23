`include "General.sv"
`include "DataGenerator.sv"
`include "Data2Segments.sv"

module DGandD2SQuartus (Clock, Button_Up, Button_Reset, Button_Down, Button_Signed, Indicators, Segments, SigneBit);
  parameter Size = 5,
            Signed = "Yes",
            ClockPeriod_ns = 20,
            FilterPeriod_ns = 1_000_000,
            PauseInterval_ns = 450_000_000,
            RepeatsInterval_ns = 150_000_000,
            RefreshTime_ns = 200_000; // 5 kHz

  localparam ISize = (Signed == "No") ? General::clog10(1<<Size):(General::clog10(1<<(Size-1))+1);
  input logic Clock, Button_Up, Button_Reset, Button_Down, Button_Signed;
  output logic [ISize-1: 0] Indicators;
  output logic [ 7: 0] Segments;

  logic [Size-1: 0] Data;
  
  
  output logic SigneBit;
  
  DataGenerator
          #(.Size(Size),
            .Signed(Signed),
            . ClockPeriod_ns(ClockPeriod_ns),
            . FilterPeriod_ns(FilterPeriod_ns),
            . PauseInterval_ns(PauseInterval_ns),
            . RepeatsInterval_ns(RepeatsInterval_ns))
  B1 (.Clock(Clock), . Button_Up(Button_Up), .Button_Reset(Button_Reset), .Button_Down(Button_Down), .Data(Data), .Button_Signed(Button_Signed), .SigneBit(SigneBit));
  
  Data2Segments
          #(. Size(Size),
            . Signed(Signed),
            . ClockPeriod_ns(ClockPeriod_ns),
            . RefreshTime_ns(RefreshTime_ns))
  B2       (.Clock(Clock), .Data(Data), .Indicators(Indicators), .Segments(Segments));
  
endmodule: DGandD2SQuartus