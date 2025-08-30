#! /usr/bin/python3
# -*- coding utf-8 -*-
# (c) 2022 fomenko a v

import os
import locale
from datetime import datetime
from calendar import month_name


def main():
    locale.setlocale(locale.LC_ALL, 'ru_RU.UTF-8')
    year = datetime.now().year
    i = 1

    for m in month_name[1:]:
        try:
            os.makedirs(f"{year}/{i:0=2} {m.capitalize()}")
        except Exception as e:
            print(e)
        i += 1


if __name__ == '__main__':
    main()
