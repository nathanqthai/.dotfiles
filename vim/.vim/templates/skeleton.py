#!/usr/bin/env python3
# vim: set ts=4 sw=4 ts=4 et :

import argparse
import logging
import logging.config
import os
import sys
import time

logging.basicConfig(level=logging.INFO)
log = logging.getLogger()


def parse_args():
    parser = argparse.ArgumentParser(description="Default")
    parser.add_argument("--debug", help="debug", action="store_true")
    parser.add_argument("-i", "--input", help="input", default="input")
    return parser.parse_args()


def main():
    args = parse_args()

    log.info("Running {}".format(__file__))
    if args.debug:
        log.setLevel(logging.DEBUG)
        log.debug("Debug mode enabled")

    # profiling
    s = time.perf_counter()

    elapsed = time.perf_counter() - s
    log.info(f"{__file__} executed in {elapsed:0.5f} seconds.")


if __name__ == "__main__":
    main()
