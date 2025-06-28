#! /usr/bin/python3
# -*- coding utf-8 -*-
# (c) 2022 fomenko a v

import os
from datetime import *
from calendar import month_name

import locale
locale.setlocale(locale.lc_all, '')


def main():
    year = datetime.now().year
    i = 1

     for m in month_name[1:]:
         try:
            os.makedirs("{}/{:0=2} {}".format(year, i, m.capitalize()))
        except:
            pass
        i += 1


if __name__ == '__main__':
    main()
