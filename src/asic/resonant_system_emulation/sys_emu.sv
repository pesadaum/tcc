package sys_emu;

  function read_q_values_from_file(string filename);
    integer file  ;
    integer parsed;
    integer i     ;
    string  data  ;

    file = $fopen(filename, "r");

    i = 0;
    while (!$feof(file)) begin : reading_file
      $fgets(data, file);
      parsed = data.atoi();

      q_array[i] = parsed;
      if (i % 10 == 0)
        $display("Reading Q = %0d at position %0d", q_array[i], i);

      i = i+1;
    end
    $fclose(file);
    $display("\n\nData acquire completed\n\n");



  endfunction//read_q_fr_valuesom_file

endpackage: sys_emu