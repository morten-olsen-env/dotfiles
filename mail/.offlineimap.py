#! /usr/bin/env python2
import os
from subprocess import check_output

def get_user():
    return os.environ.get('EMAIL')
def get_pass():
    return os.environ.get('EMAIL_PASS')
