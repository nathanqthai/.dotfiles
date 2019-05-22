#!/usr/bin/env python3
# vim: set ts=4 sw=4 tw=4 sts=4 et :

import argparse

def parse_args():
    parser = argparse.ArgumentParser(description='Template program.')
    args = parser.parse_args()

def main():
    parse_args()

    print("Hello World");


if __name__ == "__main__":
    main()
