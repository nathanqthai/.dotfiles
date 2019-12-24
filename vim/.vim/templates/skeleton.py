#!/usr/bin/env python3
# vim: set ts=4 sw=4 ts=4 et :

import argparse
import logging
import logging.config
import os
import sys
import time

log = logging.getLogger(__name__)

def init_logger(log_path):
    if not os.path.exists(log_path):
        os.makedirs(log_path)

    logging_config = {
        'version': 1,
        'disable_existing_loggers': False,
        'formatters': {
            'standard': {
                'format': '%(asctime)s [%(levelname)s] %(name)s: %(message)s'
            },
        },
        'handlers': {
            'default_handler': {
                'class': 'logging.StreamHandler',
                'level': 'DEBUG',
                'formatter': 'standard',
                'stream': sys.stdout
            },
            'file_handler': {
                'class': 'logging.FileHandler',
                'level': 'DEBUG',
                'formatter': 'standard',
                'filename': os.path.join('logs', 'application.log'),
                'encoding': 'utf8'
            },
        },
        'loggers': {
            '': {
                'handlers': ['default_handler', 'file_handler'],
                'level': 'INFO',
                'propagate': False
            }
        }
    }
    logging.config.dictConfig(logging_config)

def parse_args():
    parser = argparse.ArgumentParser(description='Default')
    parser.add_argument('--debug', help='debug', action='store_true')
    parser.add_argument('-l', '--log_path', help='logs path', default='logs')
    parser.add_argument('-i', '--input', help='input', default='input')
    return parser.parse_args()

def main():
    args = parse_args()

    # initialize logging
    init_logger(args.log_path)
    log.info("Running {}".format(__file__))
    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)
        log.debug("Debug mode enabled")

    # profiling
    s = time.perf_counter()


    elasped = time.perf_counter - s
    log.info('%s executed in %0.5f seconds.', __file__, elapsed)

if __name__ == "__main__":
    main()
