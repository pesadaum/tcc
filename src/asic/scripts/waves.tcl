database -open waves -into waves.shm -default
probe -create -shm pulse_generator_test.rst  pulse_generator_test.start  pulse_generator_test.pulse -waveform
reset
run
