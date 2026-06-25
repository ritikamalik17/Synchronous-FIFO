# Synchronous-FIFO
A synchronous FIFO is a data buffer circuit which provides sequential data flow between two systems, synchronizing them using a common clock.
It is a particularly well and practical design concept that serves as a handshaking technique and synchronisation mechanism between two modules.
Here is a block diagram for synchronous FIFO:-

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/78d51876-28f2-402b-a4a1-ad5eedfd8560" />

This project implements a Synchronous FIFO in Verilog HDL, designed for simulation in Xilinx Vivado. The FIFO operates on a single clock domain, supports parameterized data width and depth, and includes control/status signals like full, empty, w_en, r_en and reset.

## **Design Module**

The Sync_code.v module is designed to ensure efficient data handling in digital systems. Proper configuration prevents common issues like overflow or underflow, guaranteeing reliable data management. The FIFO operates on a single clock domain and supports configurable data width and depth. It uses a circular buffer with read and write pointers, and a counter to track the number of elements in the queue.


**INPUT AND OUTPUT PORTS**
| Port       | Direction | Description            |
| ---------- | --------- | ---------------------- |
|  clk       | Input     | System clock           |
|  reset     | Input     | Asynchronous reset     |
|  data_in   | Input     | Data to be written     |
|  w_en      | Input     | Write enable           |
|  r_en      | Input     | Read enable            |
|  data_out  | Output    | Data being read        |
|  full      | Output    | FIFO full status flag  |
|  empty     | Output    | FIFO empty status flag |

## **Test Bench Case Implementation**

The testbench sync_fifo_tb.v for the FIFO module generates random data and writes it to the FIFO, then reads it back and compares the results. The test bench encompasses a wide range of tests designed to rigourously validate the FIFO's operation.
Functional tests verify the FIFO's basic operations: write, read, full and empty condition.

The test case is to write 3 inputs to the fifo and then to read them. The testbench uses a single clock for writing and reading, and includes reset signal to initialize the FIFO.

## **Fifo waveform**
<img width="1116" height="272" alt="Screenshot 2026-06-25 211320" src="https://github.com/user-attachments/assets/a3992586-4a0a-406b-a2ea-b06faf09aaeb" />


## **Results**

The synchronous FIFO design was tested using a testbench. The following key results were observed:-
1. Correct Data Storage and Retrieval: The FIFO correctly stored data when written to and retrieved the exact same data when read from. This was validated across multiple test cases with varying data patterns.
2. Full and Empty Conditions: The FIFO accurately indicated full and empty conditions. When the FIFO was full, additional write operations were correctly prevented, and when the FIFO was empty, additional read operations were correctly halted.

## **Applications**
1. Keyboard input buffering
2. Data transfer between modules
3. Temporary storage in image processing
4. Communication in FPGA systems

## **Conclusion**
A parameterized synchronous FIFO was developed for Xilinx Vivado using Verilog HDL and validated in ChipVerify online compiler . The design supports reliable data buffering within a single clock domain, ensuring correct sequencing and flow control. Functional simulation verified accurate behavior across all operating conditions, including boundary cases. 
Simulation  results confirmed correct functionality, with proper handling of full, empty, read, and write operations. This design can now be integrated into larger digital systems such as processors, image buffers, or communication interfaces.

## **Limitation**
This implementation does not support simultaneous read and write operations in the same clock cycle. Read and write requests are prioritized using an `if-else` structure, allowing only one operation to be executed per clock edge. This simplification was intentionally adopted to keep the design easy to understand and verify. Future improvements may include support for concurrent read and write operations while maintaining accurate FIFO occupancy tracking.
