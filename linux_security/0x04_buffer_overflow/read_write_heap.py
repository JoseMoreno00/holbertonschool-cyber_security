#!/usr/bin/python3
import sys
import os
"""
Documentation

"""
if len(sys.argv) < 4:
    print("Usage error: You must use 3 arguments: pid , str to search, newstr")
    sys.exit(1)

maps_path = f"/proc/{sys.argv[1]}/maps"
mem_path = f"/proc/{sys.argv[1]}/mem"
to_replace = sys.argv[2].encode()
new_str = sys.argv[3].encode()
try:
    int(sys.argv[1])
except ValueError:
    print("Usage error: PID must be a integer")
    sys.exit(1)
try:
    with open(maps_path, "r") as maps_data:
        for line in maps_data:
            if "heap" in line:
                heap_line = line
                break
        memory_heap_line = heap_line.split(" r")
        memory_heap = memory_heap_line[0]
        list_memory = memory_heap.split("-")
        start_heap, end_heap = int(list_memory[0], 16), int(list_memory[1], 16)

    with open(mem_path, "r+b") as mem_data:
        mem_data.seek(start_heap)
        data = mem_data.read(end_heap - start_heap)
        off_set = data.find(to_replace)
        if len(new_str) > len(to_replace):
            print("Warning: Replacement string is longer than the search
                  string. This may cause memory corruption.")
        if off_set == -1:
            print("The str to teplace not exist in the memory that you access")
            sys.exit(1)
        mem_data.seek(start_heap + off_set)
        mem_data.write(new_str.ljust(len(to_replace), b'\x00'))

except FileNotFoundError:
    print("The procces id not exist")
except PermissionError:
    print("You dont have permissions to write the heap memory")
    sys.exit(1)
except Exception as e:
    print(f"Unexpected error: {e}")
    sys.exit(1)

