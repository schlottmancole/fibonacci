#!/usr/bin/env python

import sys
import os
import subprocess
import time

# user passes in name of python script to be regressed

# input validation
if len(sys.argv) != 2:
    exit("expected one argument")
script = sys.argv[1]
if not os.path.isfile(script):
    exit(f'"{script}" is not a valid file path"') 

# open a file for reporting
log_filename = os.path.splitext(script)[0] + ".csv"
with open(log_filename, 'w') as log:
    # test values for performance
    for n in range(1000):
        try:
            # scale n polynomially
            n = n*n
            start = time.time()
            p = subprocess.run([script, str(n)], capture_output=True, timeout=1)
            entry = f'{n},{time.time()-start:.3f},{p.stdout.decode("utf-8").strip()}'
            log.write(entry + '\n')
            print(entry)
        except subprocess.TimeoutExpired:
            break

