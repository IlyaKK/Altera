module DataCounter (Clock, Up, Reset, Down, Data);
  parameter Size = 5, Signed = "Yes";
  input var bit Clock;
  input var logic Up, Reset, Down;
  output var logic [Size-1: 0] Data = 0; // Binary

  generate
    if (Signed == "No")
      always_ff @(posedge Clock) begin: unsigned_counter
        if (~Reset) begin Data <= 0; end
        else if (Up) begin
          if (Data < 2**Size - 1) Data <= Data + 1;
        end else if (Down) begin
          if (Data != 0) Data <= Data - 1;
        end
      end: unsigned_counter
    else // [-Max, ..., -1, 0, 1, ..., Max] Sign.Magnitude
      always_ff @(posedge Clock) begin: signed_counter
        if (~Reset) begin Data <= 0; end
        else if (Up) begin
           if ((Data >= 0) && (Data < 2**(Size-1) -1)) // [ 0.. +2]
             Data <= Data + 1;
           else if ((Data > 2**(Size-1) +1) && (Data < 2**Size)) // [-3.. -2]
             Data <= Data - 1;
           else if (Data == 2**(Size-1) +1) // -1
             Data <= 0;
        end else if (Down) begin
          if ((Data > 0) && (Data < 2**(Size-1))) // [+1.. +3]
            Data <= Data - 1;
          else if ((Data > 2**(Size-1)) && (Data < 2**Size-1)) // [-1.. -2]
            Data <= Data + 1;
          else if (Data == 0) // 0
            Data <= 2**(Size-1) +1;
        end
      end: signed_counter
  endgenerate
endmodule: DataCounter