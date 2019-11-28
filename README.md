# VHDLSTrafficLight
TrafficLight simulated in VHDL
This simulation is based in a two way conection between a highway and a rural way.
There are two traffic lights, one in each way.
In normal mode, green for the highway and red for the rural one.
When one car arrives to the rural way, one sensor pull '1' one signal, and when there aren´t car in this , the signal will be changed to ´0´.
With the signal in '1' mode:
  3 seconds the highway one in yellow, and the rural one in red.
  The next 7 seconds, the highway will be in red, and the other one in yellow..
  The first rule will be repeated in the contrary. 
 After all of this, the working mode will change to normal.
 
 
 I attach a file for simulation with a clok configuration. (tb_semaforo_vhd)
